import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/ui/screens/chat_users_page.dart';
import 'package:medcaremainapp/ui/screens/emergency_page.dart';
import 'package:medcaremainapp/ui/screens/home_page.dart';
import 'package:medcaremainapp/ui/screens/medicines_page.dart';
import 'package:medcaremainapp/utils/constants.dart';
import 'package:medcaremainapp/utils/routes.dart';

import '../../../models/app_user_status.dart';
import '../../../services_and_managers/services/notitfication_service.dart';
import '../../../utils/service_locator.dart';
import '../screens/settings_page.dart';
import '../widgets.dart';

class CommonHomePageLayout extends StatefulWidget {
  const CommonHomePageLayout({Key? key}) : super(key: key);

  @override
  State<CommonHomePageLayout> createState() => _CommonHomePageLayoutState();
}

class _CommonHomePageLayoutState extends State<CommonHomePageLayout> {
  Widget _selectedWidget = const HomePage();
  String pageTitle = Constants.titleHomePage;
  int _selectedIndex = 0;
  final _notificationService = getIt<NotificationService>();

  @override
  void initState() {
    super.initState();
    _notificationService.init(_onDidReceiveLocalNotification);
  }

  void _navigateToItemSelected(int index) {
    setState((){
      _selectedIndex = index;
    });
    
    switch (index) {
      case 0:
        //to home
        setState(() {
          pageTitle = Constants.titleHomePage;
          _selectedWidget = const HomePage();
        });
        break;
        case 1:
        //to medicines
        setState(() {
          pageTitle = Constants.titleMedicineOrders;
          _selectedWidget = const MedicinesPage();
        });
        break;
      case 2:
        //to chat list screen
        setState(() {
          pageTitle = Constants.titleChats;
          _selectedWidget = const ChatListScreen();
        });
        break;
        case 3:
        //to emergency
        setState(() {
          pageTitle = Constants.titleEmergency;
          _selectedWidget = const EmergencyPage();
        });
        break;
        default:
        //to settings
        setState(() {
          pageTitle = Constants.titleSettings;
          _selectedWidget = const SettingsPage();
        });
        break;
    }
    print(pageTitle);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: [
           Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                //open notifications in new screen
                
              },
              child: const Icon(Icons.notifications, color: Colors.white)),
          )
        ]
      ),
      body: _selectedWidget,
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 45.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 99, 2, 102),
        onTap: _navigateToItemSelected,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home,),
          ),
          BottomNavigationBarItem(label: "Emergency", icon: Icon(Icons.health_and_safety)),
          BottomNavigationBarItem(label: "Chat", icon: Icon(Icons.chat)),
          BottomNavigationBarItem(label: "Medicines", icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }

  Future<dynamic> _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: Text(title ?? ''),
                content: Text(body ?? ''),
                actions: [
                  TextButton(child: const Text("Ok"), onPressed: () async {})
                ]));
  }
}
