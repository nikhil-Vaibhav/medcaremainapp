import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/utils/routes.dart';

import '../../../models/user.dart';
import '../../../services_and_managers/managers/database_manager.dart';
import '../../../services_and_managers/notifiers/auth_notitfier.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController _otpController = TextEditingController();
  final AuthNotifier _authNotifier = AuthNotifier(false);
  final _databaseManager = DatabaseManager();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator(
        backgroundColor: Colors.green,
      );
    }

    return Material(
      child: Padding(
        padding: EdgeInsets.all(13.0),
        child: Column(children: [
          const SizedBox(
            height: 100.0,
          ),
          TextFormField(
            controller: _otpController,
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                //getting firebase user
                User? signedUser =
                    await _authNotifier.verifyOTP(_otpController.text);

                setState(() {
                  isLoading = false;
                });
                //after successful sign in, create a record in database
                if (signedUser != null) {
                  _createUserRecordInDatabase(signedUser);
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                }
              },
              child: const Text("Verify"))
        ]),
      ),
    );
  }

  void _createUserRecordInDatabase(User? user) {
    AppUser appUser = AppUser(
        name: user?.displayName,
        uid: user?.uid,
        email: user?.email,
        phoneNumber: user?.phoneNumber);

    _databaseManager.updateUser(appUser);
  }
}
