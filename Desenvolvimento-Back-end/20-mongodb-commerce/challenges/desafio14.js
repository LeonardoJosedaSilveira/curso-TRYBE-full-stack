db.produtos.updateMany(
  { "valoresNutricionais.2.percentual": { $lt: 40, $gt: 20 } },
  {
    $push: {
      tags: {
        $each: ["contém sódio"],
      },
    },
  },
);
db.produtos.find({ }, { _id: 0, nome: 1, tags: 1 });
