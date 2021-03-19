 import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
