db.produtos.updateMany(
  { "valoresNutricionais.2.percentual": { $gt: 39 } },
  {
    $push: {
      tags: {
        $each: ["muito sódio"],
      },
    },
  },
);
db.produtos.find({ }, { _id: 0, nome: 1, tags: 1 });
