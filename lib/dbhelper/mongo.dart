// import 'dart:developer';

import 'package:mongoflutter/MongoDbModel.dart';
import 'package:mongoflutter/dbhelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    // inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Sth wrong";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
