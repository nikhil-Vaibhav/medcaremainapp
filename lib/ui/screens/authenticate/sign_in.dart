import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/models/user.dart';
import 'package:medcaremainapp/services_and_managers/managers/user_database_manager.dart';
import 'package:medcaremainapp/services_and_managers/notifiers/auth_notitfier.dart';
import 'package:medcaremainapp/ui/screens/home_page.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final AuthNotifier _authNotifier = AuthNotifier(false);
  final _controller = TextEditingController();
  final _userDBManager = UserDatabaseManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                dynamic res = await _authNotifier.signInWithPhone("+918988792178");
                if(res) {
                  Navigator.pushReplacementNamed(context, "/home");
                }
              },
              child: const Text("Sign In"),
            ),
            TextFormField(
              controller: _controller,
            ),
            ElevatedButton(
                onPressed: () async {
                  //getting firebase user
                  User? signedUser =
                      await _authNotifier.verifyOTP(_controller.text);

                  //after successful sign in, create a record in database
                  if (signedUser != null) {
                    _createUserRecordInDatabase(signedUser);
                    Navigator.pushReplacementNamed(context, "/home");
                  }
                },
                child: const Text("Verify")),
          ],
        ),
      ),
    );
  }

  void _createUserRecordInDatabase(User? user) {
    AppUser appUser = AppUser(
        name: user?.displayName,
        uid: user?.uid,
        email: user?.email,
        phoneNumber: user?.phoneNumber);

    _userDBManager.updateUser(appUser);
  }
}
