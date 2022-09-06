import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart ' show rootBundle;
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart' as inbox;
import 'package:telephony/telephony.dart' as telephony;
import 'package:telephony/telephony.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  inbox.SmsQuery smsQuery = inbox.SmsQuery();
  String addressString = "\b\d+\.\d+\b";
  int messageLength = 0;
  List address = [];
  List<telephony.SmsMessage> teleMessages = <telephony.SmsMessage>[];

  //SmsQuery smsQuery = SmsQuery();
  List<inbox.SmsMessage> messages = <inbox.SmsMessage>[];

  late String singleAddress;

  late var telephonyIns = telephony.Telephony.instance;
  @override
  void initState() {
    /*initPlatformState();*/
    singleAddress = "";
    getAddress();
    super.initState();
    /*getAddress();
    telephonyIns = telephony.Telephony.instance;
    telephonyMessages();
    getAddress();*/
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      //future: telephonyMessages(),
      future: fetchSMS(),

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Text('loading...');
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return createListView(context, snapshot);
            }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: futureBuilder,
    );
  }

  Future<List<inbox.SmsMessage>> fetchSMS() async {
    /*messages = await smsQuery.getAllSms;*/

    messages = await smsQuery
        .querySms(kinds: [inbox.SmsQueryKind.inbox], address: "NICA_ALERT");
    messageLength = messages.length;

    return messages;
    //messages = await smsQuery.querySms(address: "+9779866548364");
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<inbox.SmsMessage> values = snapshot.data;
    return Scaffold(
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          getAddress();
        },
      ),*/
      body: ListView.builder(
        //itemCount: teleMessages.length.toInt(),
        //itemCount: values.length,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.markunread,
                  color: Colors.pink,
                ),
                title: Text(messages[index].address.toString()),
                /*title: messages.isEmpty
                    ? const CircularProgressIndicator()
                    : Text(messages[index].address.toString()),*/
                subtitle: Text(
                  messages[index].body.toString(),
                  //teleMessages[index].body.toString(),
                  maxLines: 2,
                  style: const TextStyle(),
                ),
              ),
              /*ListTile(
                title: Text(values![index]),
              ),*/
              const Divider(
                height: 2.0,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<String> getAddress() async {
    final bankAddress = json.decode(await getJson());
    setState(() {
      address = bankAddress["bankAddress"];
      for (var i = 0; i < address.length; i++) {
        singleAddress = address[i].toString();
        /* print(singleAddress);*/
      }
    });

    return singleAddress;
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/bank_address.json');

/*for (var i = 0; i < messages.length; i++) {
      if ((messages[i].body).toString().contains(addressString)) {
        fetchSMS();
      }
    }*/
  }

  Future<List<telephony.SmsMessage>> telephonyMessages() async {
    teleMessages = await telephonyIns.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
        filter: SmsFilter.where(SmsColumn.ADDRESS)
            .equals("9861168873")
            .and(SmsColumn.BODY)
            .like("babe"),
        sortOrder: [
          OrderBy(SmsColumn.ADDRESS, sort: Sort.ASC),
          OrderBy(SmsColumn.BODY)
        ]);
    return teleMessages;
  }

/*
  String getSingleAddress() {
    getAddress();
    for (var i = 0; i < address.length; i++) {
      setState(() {
        singleAddress = address[i].toString();
      });
    }
    return singleAddress;
  }*/

}
