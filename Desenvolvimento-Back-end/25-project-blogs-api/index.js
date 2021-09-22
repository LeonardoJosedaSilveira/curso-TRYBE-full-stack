const express = require('express');
const bodyParse = require('body-parser');
const userRouter = require('./router/userRouter');
const loginRouter = require('./router/loginRouter');
const blogpostRouter = require('./router/blogpostRouter');
const categorieRouter = require('./router/categorieRouter');

const app = express();
const PORT = 3000; // trocar para 3000

app.use(bodyParse.json());

app.listen(PORT, () => console.log(`ouvindo porta ${PORT}!`));

// não remova esse endpoint, e para o avaliador funcionar
app.get('/', (request, response) => {
  response.send();
});

// rota inicial cadastro de usuario
app.use('/user', userRouter);

// rota inicial login
app.use('/login', loginRouter);

// rota inicial categorias
app.use('/categories', categorieRouter);

// rota inicial blogpost
app.use('/post', blogpostRouter);
