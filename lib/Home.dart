import 'user_list.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sgp_ejewellery/LoginPage.dart';
import 'package:sgp_ejewellery/sgpuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sgp_ejewellery/Database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid;
  @override
  Widget build(BuildContext context) {

    void _showSettingpanel(){
      showModalBottomSheet(context: context,builder: (context)
      {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: Text('bottom sheet'),
        );
      }
      );
    }


    return StreamProvider<List<sgpuser>>.value( //StreamProvider<QuerySnapshot>.value(
      value: Database().user,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
        TextButton.icon(
          style:TextButton.styleFrom(primary: Colors.black),
        icon: Icon(Icons.person),
          label: Text('logout'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
              },
            ),
      TextButton.icon(
        style:TextButton.styleFrom(primary: Colors.black),
        icon: Icon(Icons.settings_applications_rounded),
        label: Text('Setting'),
        onPressed: () => _showSettingpanel(),
    ),
          ],

        ),
        body: Center(
          child: UserList(),//Text(uid),
        ),

      ),
    );
  }

  @override
  void initState() {

    super.initState();
    //Database().user;
    uid = FirebaseAuth.instance.currentUser.uid;

  }
}
