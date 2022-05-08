import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/models/user.dart';
import 'package:medcaremainapp/services_and_managers/notifiers/auth_notitfier.dart';
import 'package:medcaremainapp/ui/screens/home_page.dart';
import 'package:medcaremainapp/utils/routes.dart';

import '../../../services_and_managers/managers/database_manager.dart';
import '../../../utils/constants.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final AuthNotifier _authNotifier = AuthNotifier(false);
  final _controller = TextEditingController();
  final _databaseManager = DatabaseManager();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return const CircularProgressIndicator(
        backgroundColor: Colors.green,
      );
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
        child: Column(
          children: [
            const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: Constants.formHintName,
              )
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: Constants.formHintPhone,
              )
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                dynamic res = await _authNotifier.signInWithPhone("+91"+ _controller.text);
                setState(() {
                  isLoading = false;
                });
                if(res) {
                  // print(res);
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                } else {
                  //No account exists
                }
              }, child: const Text("Sign In"))

          ],
        ),
      );
  }

}
