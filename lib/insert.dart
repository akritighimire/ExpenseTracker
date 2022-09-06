import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongoflutter/MongoDbModel.dart';
import 'package:mongoflutter/dbhelper/mongo.dart';

abstract class MongoDbInsert extends StatefulWidget {
  MongoDbInsert({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MongoDbInsertState createstate() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  var lnameController = new TextEditingController();
  var fnameController = new TextEditingController();
  var addressController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Insert Data",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
                controller: fnameController,
                decoration: InputDecoration(labelText: "First Name")),
            TextField(
                controller: lnameController,
                decoration: InputDecoration(labelText: "Last Name")),
            TextField(
              minLines: 3,
              maxLines: 5,
              controller: addressController,
              decoration: InputDecoration(labelText: "address"),
            ),
            Row(
              children: [
                OutlinedButton(onPressed: () {}, child: Text("Insert Data")),
                OutlinedButton(onPressed: () {}, child: Text("No Need"))
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> _insertData(String fName, String lName, String address) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
        id: _id, firstName: fName, lastName: lName, address: address);
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Insertrd ID " + _id.toString())));
    _clearAll();
  }

  void _clearAll() {
    fnameController.text = "";
    lnameController.text = "";
    addressController.text = "";
  }

  void _fakeData() {
    setState(() {
      var faker;
      fnameController.text = faker.person.firstName();
      lnameController.text = faker.person.lastName();
      addressController.text =
          faker.address.streetName() + "\n" + faker.address.streetAddress();
    });
  }
}
