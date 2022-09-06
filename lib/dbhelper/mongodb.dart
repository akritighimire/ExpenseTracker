// import 'dart:developer';

// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:mongoflutter/dbhelper/constant.dart';

// import './constant.dart';

// class MongoDatabase {
//   static connect()async {
//     var db = await Db.create(MONGO_URL);
//     await db.open(); //open the connection
//     inspect(db); //will print out a bunch of settings
//     var status = db.serverStatus();
//     print(status);
//     var collection = db.collection(COLLECTION_NAME); //call the connection ,we use this line to save del or update anything
//     await collection.insertOne({
//       "username": "mp",
//       "name": "Max Pan",
//       "email": "maxpan@gmail.com"
//     },
//     // {
//     //   "username": "mp2",
//     //   "name": "Max Pann",
//     //   "email": "maxpan2@gmail.com"
//     // },
//     // {
//     //   "username": "mp3",
//     //   "name": "Max Pannnn",
//     //   "email": "maxpan3@gmail.com"
//     // }
//     );
//     print(await collection.find().toList());

//   }
// }