const { User } = require('../models');
const userController = require('../controller/userController');

const createUser = (req, res, _next) => {
  const { displayName, email, password, image } = req.body;
  User.create({ displayName, email, password, image })
    .then((newUser) => {
      const reply = userController.createUserReplyOk(newUser);
      res.status(reply.code).json(reply.user);
    })
    .catch((e) => {
      const reply = userController.createUserReplyError(e.errors[0].message);
      res.status(reply.code).send({ message: reply.phrase }); 
    });
};

const showAllUsers = (req, res, _next) => {
  User.findAll({ attributes: ['id', 'displayName', 'email', 'image'] })
    .then((listUser) => {
      const reply = userController.showAllOk(listUser);
      res.status(reply.code).send(reply.newVraw);
    });
};

const findId = (req, res, _next) => {
  const { id } = req.params;
  User.findOne({ where: { id } })
    .then((selectUser) => {
      if (!selectUser) {
        const reply = userController.findUserError(selectUser);
        return res.status(reply.code).send({ message: reply.phrase });
      }      
      const reply = userController.findUserOk(selectUser);
      res.status(reply.code).send(reply.user);
    });
};

module.exports = {
  createUser,
  showAllUsers,
  findId,
};