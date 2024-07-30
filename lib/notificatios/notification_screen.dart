import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications extends StatefulWidget {
  const LocalNotifications({super.key});

  @override
  State<LocalNotifications> createState() => _LocalNotificationsState();
}

class _LocalNotificationsState extends State<LocalNotifications> {
  @override
  void initState() {
    super.initState();
    getNotificationOnForeground();
    showFcmToken();
    handleTerminatedStateMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // viewNotification();
            // showFcmToken();
          }, child: const Text("click"),
        ),
      ),
    );
  }

  showFcmToken() async {
    var firebaseToken = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $firebaseToken");

  }

  getNotificationOnForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('show foreground message: ${message.notification?.title}');
      print('Message data: ${message.notification?.body}');

      if (message.notification != null) {
        viewNotification(message);
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  handleTerminatedStateMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print('App Terminated');
      viewNotification(initialMessage);
    }
  }

  viewNotification(RemoteMessage message) {
    var notificationsPlugin = FlutterLocalNotificationsPlugin();
    notificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      ),
    );
    notificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "channelId",
          "channelName",
        ),
      ),
    );
  }
}