import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    ;
    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: onTapNotification);
  }

  static void onTapNotification(NotificationResponse? notificationResponse) {
    print(
        'Notification clicked with payload: ${notificationResponse!.payload}');
  }

  Future<void> showNotification() async {
    final AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('shopZan_ID', 'shopZan',
            importance: Importance.max, priority: Priority.high);
            final DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true
            );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );
    await flutterLocalNotificationsPlugin.show(
        0, "Notification Title", "Notification Body", notificationDetails);
  }
}
