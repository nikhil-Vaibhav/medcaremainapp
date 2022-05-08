import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/ui/layouts/common_home_page_layout.dart';
import 'package:medcaremainapp/ui/screens/authenticate/otp_verification.dart';
import 'package:medcaremainapp/ui/screens/chat_main_screen.dart';
import 'package:medcaremainapp/ui/screens/chat_users_page.dart';
import 'package:medcaremainapp/ui/screens/wrapper.dart';
import 'package:medcaremainapp/utils/routes.dart';
import 'package:medcaremainapp/utils/service_locator.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: defaultFirebaseAppName);
  setUpServiceLocator();
  
  runApp( DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),);
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const Wrapper(),
      routes: {
        Routes.homeRoute : (context) => const CommonHomePageLayout(),
        "/chat_list_screen" : (context) => const ChatListScreen(),
        Routes.chatMainScreenRoute : (context) => const ChatScreen(),
        Routes.verifyRoute : (context) => const OTPVerification()
      },
    );
  }

}
