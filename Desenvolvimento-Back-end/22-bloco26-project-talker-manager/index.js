const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs').promises;
const { consulteTalker, criandoToken, criandoTalker } = require('./svcs/servicos');
const {
  validaEmail,
  validaSenha,
  validaToken,
  validaNome,
  validaIdade,
  validaTalk,
  validaData,
  validaRate } = require('./svcs/validacoes');

const app = express();
app.use(bodyParser.json());

const HTTP_OK_STATUS = 200;
const PORT = '3000';

// não remova esse endpoint, e para o avaliador funcionar
app.get('/', (_request, response) => {
  response.status(HTTP_OK_STATUS).send();
});

// consulta lista de talkers
app.get('/talker', async (_request, response) => {
  const talker = await consulteTalker();
  if (talker.length === 0) {
   return response.status(HTTP_OK_STATUS).send([]);
  } 
  response.status(HTTP_OK_STATUS).json(talker);
});

// consulta talker por ID
app.get('/talker/:id', async (request, response) => {
  const talker = await consulteTalker();
  const { id } = request.params;
  const talkerSelecionado = talker.find((item) => item.id === parseInt(id, 10));
  if (!talkerSelecionado) {
    return response.status(404).json({ message: 'Pessoa palestrante não encontrada' });
  }
  response.status(HTTP_OK_STATUS).json(talkerSelecionado);   
});

// token e loguin
app.post('/login', validaEmail, validaSenha, (_request, response) => {
  const token = criandoToken();
  response.status(HTTP_OK_STATUS).json({ token });
});

// grava novo talker
app.post('/talker',
  validaToken,
  validaNome,
  validaIdade,
  validaTalk,
  validaData,
  validaRate,
  async (request, response) => {
    const talkers = await consulteTalker();
    const novoTalker = await criandoTalker(request.body);
    talkers.push(novoTalker);
    await fs.writeFile('./talker.json', JSON.stringify(talkers));
    response.status(201).json({ ...novoTalker });
  });

// edita o talker
app.put('/talker/:id',
validaToken,
validaNome,
validaIdade,
validaTalk,
validaData,
validaRate,
async (request, response) => {
  const { id } = request.params;
  const { body } = request;
  const talkers = await consulteTalker();
  const escolheTalker = talkers.find((item) => item.id === +(id));
  const outrosTalker = talkers.filter((item) => item.id !== +(id));
  const mudancaNoTalker = {
    ...body,
    id: escolheTalker.id,
  };
  const novaListaTalkers = [...outrosTalker, mudancaNoTalker];
  await fs.writeFile('./talker.json', JSON.stringify(novaListaTalkers));
  response.status(200).json(mudancaNoTalker);
});

// deleta o talker
app.delete('/talker/:id', validaToken, async (request, response) => {
  const { id } = request.params;
  const talkers = await consulteTalker();
  // cria uma nova lista apenas sem o talker escolhido
  const removeTalker = talkers.filter((element) => element.id !== +id);
  await fs.writeFile('./talker.json', JSON.stringify(removeTalker));
  response.status(200).json({ message: 'Pessoa palestrante deletada com sucesso' });
});

app.listen(PORT, () => {
  console.log('Online');
});
