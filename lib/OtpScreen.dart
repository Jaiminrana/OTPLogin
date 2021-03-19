import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'Home.dart';
//import 'package:pinput/pin_put/pin_put_state.dart';
class OtpScreen extends StatefulWidget {
  final String phoneNo;
  OtpScreen(this.phoneNo);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

   //final GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();
   String _verificationOTPCode;
   final FirebaseAuth _auth=FirebaseAuth.instance;
   final _pinPutController = TextEditingController();
   final _pinPutFocusNode = FocusNode();
   final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(43, 46, 66, 1),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: const Color.fromRGBO(126, 203, 224, 1),
      )
   );
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(40),
            child: Center(
              child: Text('Verify +91-${widget.phoneNo}',
              style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),
              ),
            ),
          ),
            Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
            fieldsCount: 6,
            withCursor: true,
            textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
            eachFieldWidth: 40.0,
            eachFieldHeight: 55.0,
            focusNode: _pinPutFocusNode,
            controller: _pinPutController,
            submittedFieldDecoration: pinPutDecoration,
            selectedFieldDecoration: pinPutDecoration,
            followingFieldDecoration: pinPutDecoration,
            pinAnimationType: PinAnimationType.fade,
              // onSubmit: (String pin) => _showSnackBar(pin),
              onSubmit: (pin) async {
              try{
              await _auth
                  .signInWithCredential(PhoneAuthProvider.credential(
                  verificationId: _verificationOTPCode, smsCode: pin))
                  .then((value) async {
                if(value.user!=null){
                  //print('pass home');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder:(context)=>Home()),
                      (route)=>false);
                }
                });
              }
                catch(e){
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:Text('invalid OPT')));

                //_globalKey.currentState.showSnackBar(SnackBar(content: 'Text(invalid OPT')));
                   }
                  },
                ),
              ),
            ],
          ),
        );
      }

 _verifyphone() async{
    await _auth.verifyPhoneNumber(
        phoneNumber:'+91${widget.phoneNo}',
        verificationCompleted: (PhoneAuthCredential credential)async{
          await _auth.signInWithCredential(credential).then((value)async{
           /* if(value.user!=null)
              {
                //print('user LOGGED IN successfully');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context)=>Home()  ), (route) => false);
              }*/
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)=>Home()  ), (route) => false);

          });

        },
        verificationFailed: (FirebaseAuthException e){
          print(e.message);
        },
        codeSent: (String verificationID,int resendToken){
          setState(() {
            _verificationOTPCode=verificationID;
          });
        },
        codeAutoRetrievalTimeout:(String verificationID) {
          setState(() {
            _verificationOTPCode = verificationID;
          });
        },
      timeout: Duration(seconds: 60),
    );
  }
  @override
    void initState(){
    super.initState();
    _verifyphone();
  }
}
