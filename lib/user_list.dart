import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgp_ejewellery/sgpuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_tile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {


    //final users = Provider.of<QuerySnapshot>(context);
    //print(users.docs);
    /*for (var doc in users.docs)
    {
      print(doc.data());
    }*/
    final users = Provider.of<List<sgpuser>>(context);
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
        return userTile(user:users[index]);
      },
    );


    /*users.forEach((sgpuser)
    {
      print(sgpuser.name);
      print(sgpuser.gender);
      print(sgpuser.age);
    });

    return Container();*/
  }
}

