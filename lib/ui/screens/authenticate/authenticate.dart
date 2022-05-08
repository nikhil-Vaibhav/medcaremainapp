import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/ui/screens/authenticate/sign_in.dart';
import 'package:medcaremainapp/ui/screens/authenticate/sign_up.dart';
import 'package:medcaremainapp/utils/constants.dart';
import 'package:medcaremainapp/utils/image_paths.dart';

/*
Authenticate widget
*/
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}



class _AuthenticateState extends State<Authenticate> {
  bool _newUser = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
        child: Column(
          children: [
            Image.asset(userImage),
              const SizedBox(height: 10.0,),

              _newUser ? SignUpWidget() : SignInWidget(),

              const SizedBox(height: 20.0,),
              Text("Don't have an account "),
              GestureDetector(
                        onTap: () {
                          setState(() {
                            _newUser = true;
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 100,
                          child: const Text("Sign up",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.purple,
                              )),
                        ))
            
          ]
        ),
      ),
    );
  }
}
