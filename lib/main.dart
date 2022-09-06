// import 'package:mongoflutter/sms.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   void initState() {
//     checkPermission();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Expense Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       //home: const MyInbox(title: 'Expense Tracker'),
//       home: const MyHomePage(),
//       //home: const ReadMessages(title: 'Expense Tracker'),
//       //home: const ReceiveSms(),
//     );
//   }

//   Future checkPermission() async {
//     bool serviceEnabled;
//     Permission permission;

//     // Test if location services are enabled.
//     PermissionStatus result = await Permission.sms.request();

//     serviceEnabled = await Permission.sms.isGranted;
//     if (!serviceEnabled) {
//       await Permission.sms.request();
//       //await Geolocator.requestPermission();;
//       return Future.error('Permission services are disabled.');
//     }
//   }
// }
