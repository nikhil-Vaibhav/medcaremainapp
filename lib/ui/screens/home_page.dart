import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/services_and_managers/managers/appointment_manager.dart';
import 'package:medcaremainapp/services_and_managers/services/notitfication_service.dart';
import 'package:medcaremainapp/ui/widgets.dart';
import 'package:medcaremainapp/utils/constants.dart';

import '../../utils/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appManager = AppointmentManager();
  final _notificationService = getIt<NotificationService>();

  @override
  void initState() {
    super.initState();
    _notificationService.init(_onDidReceiveLocalNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              //show notifications
              _notificationService.showNotification("Hello notify....");

            },
            child: const Text("Notify")),
      ),
      drawer: const CustomDrawer(),
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
                  TextButton(
                      child: const Text("Ok"),
                      onPressed: () async {
                        
                      })
                ]));
  }
}
