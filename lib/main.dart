import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sgp_ejewellery/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
