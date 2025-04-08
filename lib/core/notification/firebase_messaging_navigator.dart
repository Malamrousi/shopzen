import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/notification/local_notifications.dart';

import '../routes/route_name.dart';

class FirebaseMessagingNavigator {
  static Future<void> RemoteNotification(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotifications.showNotification(
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        payload: message.data['productId'] ?? '',
      );
    }
  }

  //Back Ground Notification
  static Future<void> BackgroundNotification(RemoteMessage? message) async {
    if (message != null) {
      _navigate(message);
    }
  }

  static void _navigate(RemoteMessage message) {
    if (int.parse(message.data['productId'].toString()) == -1) {
      return;
    }
    getIt<GlobalKey<NavigatorState>>().currentState!.pushNamed(
        RouteName.productDetails,
        arguments: int.parse(message.data['productId'] ?? ''));
  }

  //Terminated Notification

  static Future<void> TerminatedNotification(RemoteMessage? message) async {
    if (message != null) {
      _navigate(message);
    }
  }
}
