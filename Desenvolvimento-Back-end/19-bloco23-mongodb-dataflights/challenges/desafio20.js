db.voos.find({ rtk: { $eq: null } }, { _id: 0, vooId: 1 }).limit(1);
