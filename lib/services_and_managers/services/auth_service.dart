
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/models/app_user_status.dart';

import '../../utils/service_locator.dart';
import 'database_services/user_database.dart';

class AuthService {

  
  String verifId = "";
  dynamic _phoneAuthCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anonymously
  Future signInAnon() async {
  }

  //sign in with phone
  Future signInWithPhone(String phoneNumber) async {
    //Check if user is already registered
    bool userPresent = await getIt<UserDatabaseService>().checkIfUserExists(phoneNumber);
    if(userPresent) {
      return true;
    }

    //register new user
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("timeout");
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        //code sent
        debugPrint("code sent");
        verifId = verificationId;
        // _phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        debugPrint("Verif complete");
       _phoneAuthCredential = phoneAuthCredential;
      },
      verificationFailed: (FirebaseAuthException error) {
        debugPrint(error.toString());
      });
  }

  //verify OTP
  Future verifyOTP(String otp) async {
  _phoneAuthCredential ??=
      PhoneAuthProvider.credential(verificationId: verifId, smsCode: otp);
  await _auth.signInWithCredential(_phoneAuthCredential);
  User? user = _auth.currentUser;

  if (user == null) {
    debugPrint("Not signed in");
  } else {
    debugPrint("Success");
    
    debugPrint(user.toString());
  }
  return user;
}

  //todo : sign out

}