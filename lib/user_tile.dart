import 'package:flutter/material.dart';
import 'sgpuser.dart';

class userTile extends StatelessWidget{
    final sgpuser user;
    userTile({this.user});

    @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(top: 10.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6, 20.0, 0),
          child: ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage("https://th.bing.com/th/id/OIP.E-RKApzbFgoNOOmxKInb8gHaLS?w=132&h=201&c=7&o=5&dpr=1.38&pid=1.7.jpg"),
              radius: 25.000,
              //backgroundColor: Colors.red[user.age],
            ),
            title: Text(user.name),
            subtitle: Text('AGE: ${user.age}  and GENDER:${user.gender}'),
          ),
        ),
    );
  }
}