import 'package:flutter/material.dart';
import 'package:medcaremainapp/services_and_managers/notifiers/auth_notitfier.dart';
import 'package:medcaremainapp/ui/screens/authenticate/authenticate.dart';
import 'package:medcaremainapp/ui/screens/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo: based on user auth return home page or authenticate page

    return const Authenticate();
  }
}
