
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgp_ejewellery/OtpScreen.dart';

 class LoginScreen extends StatefulWidget {
   @override
   _LoginScreenState createState() => _LoginScreenState();
 }
 
 class _LoginScreenState extends State<LoginScreen> {
   TextEditingController _controller=TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(
       title:Text('LOGIN SCREEN'),
       ),
       body: Column(
         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           //Padding(padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0))
           Center(
             child: Container(
                margin: EdgeInsets.only(left: 55,bottom: 20,top: 20),
                 child:Center(
                   child: Text('MOBILE PHONE AUTHENTICATION',
                   style: TextStyle(fontWeight: FontWeight.bold,
                   fontSize: 28),
                   ),
                 ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 5,left: 5),
             child: TextField(decoration: InputDecoration(hintText:'10 digits mobile number',
             prefix: Padding(
               padding:EdgeInsets.all(20),
               child: Text('+91'),
             ),
             ),
               maxLength: 10,
               keyboardType:TextInputType.number,
               controller: _controller,
             ),
           ),
           Container(
             margin:  EdgeInsets.all(10.0),
             width: double.infinity,
             child: TextButton(
                style:TextButton.styleFrom(
                                  backgroundColor:Colors.black,
                            ),
               onPressed: (){
                 Navigator.of(context).push(
                   MaterialPageRoute(builder:
                       (context)=>OtpScreen(_controller.text),
                   ),
                 );
               },
               child: Text('Next'),

             ),


           ),
         ],
       ),

     );
   }
 }
 