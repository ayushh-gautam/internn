import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GetNotifications {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();
  static Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //for ios and mac
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => null,
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    _notificationPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) => null);
  }

  static Future showNotification(
      {required String title,
      required String body,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _notificationPlugin.show(0, title, body, notificationDetails,
        payload: payload);
  }
}
