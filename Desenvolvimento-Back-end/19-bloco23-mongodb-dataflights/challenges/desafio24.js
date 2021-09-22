db.voos.find({
  $and: [
    { litrosCombustivel: { $lt: 600 } },
    { litrosCombustivel: { $gt: 0 } },
    { "empresa.nome": { $ne: "GOL" } },
    { "empresa.nome": { $ne: "AZUL" } },
  ],
},
{ _id: 0, vooId: 1, "empresa.nome": 1, litrosCombustivel: 1 }).limit(1);
