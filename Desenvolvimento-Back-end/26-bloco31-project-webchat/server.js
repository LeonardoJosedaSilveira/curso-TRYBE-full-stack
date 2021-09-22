// Faça seu código aqui

const express = require('express');
const http = require('http');
const { Server } = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = new Server(server);
const CreateHist = require('./models/messageModel');

const PORT = 3000;

const chaters = {};

app.get('/', (req, res) => {
  res.sendFile(`${__dirname}/index.html`);
});

io.on('connection', async (socket) => {
  // novo chater
  chaters[socket.id] = {
    chatMessage: '',
    name: socket.id.slice(0, 16),
  };
  
  // aviso connect
  console.log(`${chaters[socket.id].name} entro bichao`);

  // historico
  const list = await CreateHist.historyRead();
  list.forEach((history) => {
    const { timestamp, nickname, chatMessage } = history;
    const msg = `${timestamp} - ${nickname}: ${chatMessage}`;
    socket.emit('history', msg);
  });
});

// envio de mensagem
io.on('connection', (socket) => {  
  socket.on('message', (message) => {
    const { chatMessage } = message;
    let { nickname } = message;

    if (nickname === '') { nickname = chaters[socket.id].name; }
    const msg = `${new Date().toLocaleString('es-CL')} - ${nickname}: ${chatMessage}`;
    io.emit('message', msg);

    console.log(`bichao o ${nickname} mandou a braba: ${chatMessage}`);

    CreateHist.createMessage(chatMessage, nickname);
  });
});

server.listen(PORT, () => {
  console.log(`vrawwwwwww na porta : ${PORT}`);
});

// editar nick
io.on('connection', (socket) => {
  socket.on('nickname', (nickname) => {
    chaters[socket.id].name = nickname;
    io.emit('nickname', chaters);
  });
});

// aviso desconect
io.on('connection', (socket) => {
  socket.on('disconnect', () => {
    console.log(`${chaters[socket.id].name} saiu bichao`);
    delete chaters[socket.id];
    io.emit('nickname', chaters);
  });
});

// lista de usuario on  
io.on('connection', () => {
  io.emit('nickname', chaters);
});
