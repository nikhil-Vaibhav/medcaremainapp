import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> init(
      Future<dynamic> Function(int, String?, String?, String?)?
          onDidReceive) async {
    //android initialization
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('notific_icon');

    //iOS initialization
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceive,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: null);

    await notificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(String message) async {
    //android notify details
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails("channelId1", "Test channel");

    //iOS notify details
    IOSNotificationDetails iosDetails = const IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails details =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    notificationsPlugin.show(1, "Notify test title", message, details);
  }
}
