import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future createUserWithPhone(String phone, BuildContext context) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 0),
        verificationCompleted: (AuthCredential authCredential) {
          _auth.signInWithCredential(authCredential).then((e){
            Navigator.of(context).pushReplacementNamed('/home');
          }).catchError((e) {
            return "error";
          });
        },
        verificationFailed: (e) {
          print (e);
        },
        codeSent: (String verificationId, [int ]) {
          final _codeController = TextEditingController();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("Enter Verification Code From Text Message"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[TextField(controller: _codeController)],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("submit"),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    var _credential = PhoneAuthProvider.credential(verificationId: verificationId,
                        smsCode: _codeController.text.trim());
                    _auth.signInWithCredential(_credential).then((e){
                      Navigator.of(context).pushReplacementNamed('/home');
                    }).catchError((e) {
                      return "error";
                    });
                  },
                )
              ],
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
        });
  }
}