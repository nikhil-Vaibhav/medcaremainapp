import 'package:flutter/material.dart';
import 'package:medcaremainapp/services_and_managers/services/notitfication_service.dart';
import 'package:medcaremainapp/ui/screens/authenticate/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medcaremainapp/ui/screens/home_page.dart';
import 'package:medcaremainapp/ui/screens/wrapper.dart';
import 'package:medcaremainapp/utils/service_locator.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: defaultFirebaseAppName);
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Wrapper(),
      routes: {
        "/home" : (context) => const HomePage(),
      },
    );
  }

}
