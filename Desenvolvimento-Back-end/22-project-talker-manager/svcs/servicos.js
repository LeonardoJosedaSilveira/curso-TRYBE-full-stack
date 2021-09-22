const fs = require('fs').promises;
const crypto = require('crypto');

// consulta lista de talkers
const consulteTalker = async () => {
  try {
    const response = await fs.readFile('./talker.json');
    return JSON.parse(response);
  } catch (error) {
    console.log(error);
  }
};

// gera um tokem pro loguin e senha
function criandoToken() {
  return crypto.randomBytes(8).toString('hex');
}

// cria novo talkers
const criandoTalker = async (talker) => {
  try {
    const response = await fs.readFile('./talker.json');
    const objetoTalker = { 
      id: JSON.parse(response).length + 1, 
      ...talker,
    };
    return objetoTalker;
  } catch (error) {
    console.log(error);
  }
};

module.exports = { consulteTalker, criandoToken, criandoTalker };