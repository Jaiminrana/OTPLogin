import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sgp_ejewellery/LoginPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('HOME SCREEN'),
        actions: [
          IconButton(
              icon:Icon(Icons.person),
              onPressed:()async{
                //await _auth.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context)=>LoginScreen()),
                        (route) => false);

              }),
        ],

      ),
      body: Center(
        child: Text('current user ID:'+uid),

      ),
    );
  }
  @override

  void initState(){
    super.initState();
    uid=FirebaseAuth.instance.currentUser.uid;
  }

}
