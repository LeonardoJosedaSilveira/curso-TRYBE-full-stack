const stateOk = 200;
const stateCreated = 201;
const stateBadRequest = 400;

const createCategorieError = (answer) => {
  if (answer === 'Categorie.name cannot be null') {
    return { code: stateBadRequest, phrase: '"name" is required' };
  }
};

const createCategorieOk = (newCategorie) => {
  const categorie = newCategorie;
  return { code: stateCreated, categorie };
};

const showAllOk = (list) => ({ code: stateOk, list });

module.exports = {
  createCategorieOk,
  createCategorieError,
  showAllOk,
};