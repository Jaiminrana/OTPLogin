import 'package:flutter/material.dart';
import 'package:sgp_ejewellery/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid = '';
  @override
  void initState() {
    //uid ='';
    final User user = auth.currentUser;
    final uid = user.uid;
    try{
      setState(() {
        this.uid = uid;
      });
    }
    catch(e)
    {
      print(e);
    }

    super.initState();
  }

  Future<void> _logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=> LoginScreen()),);
    } catch(e){
      print(e.toString());
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
        centerTitle: true,

      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text("Welcome"),
              SizedBox(
                height: 10,

              ),
              OutlinedButton(
                onPressed:(){ _logout();},
                child: Text("Log out", style: TextStyle(
                color: Colors.blue,
                ),
               ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}