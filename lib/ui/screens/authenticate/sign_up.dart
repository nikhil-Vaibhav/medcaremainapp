import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/utils/routes.dart';

import '../../../models/user.dart';
import '../../../services_and_managers/managers/database_manager.dart';
import '../../../services_and_managers/notifiers/auth_notitfier.dart';
import '../../../utils/constants.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final AuthNotifier _authNotifier = AuthNotifier(false);
  final _controller = TextEditingController();
  final _databaseManager = DatabaseManager();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
              decoration: const InputDecoration(
            hintText: Constants.formHintName,
          )),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
              decoration: const InputDecoration(
            hintText: Constants.formHintEmail,
          )),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: Constants.formHintPhone,
              )),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () async {
                _authNotifier.signInWithPhone(_controller.text);

                Navigator.pushReplacementNamed(context, Routes.verifyRoute);
              },
              child: const Text("Sign up"))
        ],
      ),
    );
  }
}
