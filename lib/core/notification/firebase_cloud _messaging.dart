import 'dart:developer' as dev;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/utils/show_toast.dart';

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();
  static final FirebaseCloudMessaging instance = FirebaseCloudMessaging._();
  factory FirebaseCloudMessaging() => instance;

  static final FirebaseMessaging fcm = FirebaseMessaging.instance;
  static final String topic = dotenv.env['TOPIC'] ?? 'default_topic';
  bool isNotificationEnabled = false;
  final ValueNotifier<bool> isNotificationSubscribed = ValueNotifier(false);

  Future<void> init() async {
    try {
      await permissionNotification();
    } catch (e) {
      dev.log('Error initializing FCM: $e');
    }
  }

  Future<void> permissionNotification() async {
    try {
      NotificationSettings settings = await fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: false,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      switch (settings.authorizationStatus) {
        case AuthorizationStatus.authorized:
          isNotificationEnabled = true;
          await _checkSubscriptionStatus();
          dev.log("=== 🔔🔔🔔 User accepted notification permission 🔔🔔🔔");
          break;
        case AuthorizationStatus.provisional:
          isNotificationEnabled = true;
          await _checkSubscriptionStatus();
          dev.log(
              "=== 🔔🔔🔔 User granted provisional notification permission 🔔🔔🔔");
          break;
        case AuthorizationStatus.denied:
          isNotificationEnabled = false;
          isNotificationSubscribed.value = false;
          dev.log("=== ⚠️⚠️⚠️ User denied notification permission ⚠️⚠️⚠️");
          break;
        case AuthorizationStatus.notDetermined:
          isNotificationEnabled = false;
          isNotificationSubscribed.value = false;
          dev.log("=== ⚠️⚠️⚠️ Notification permission not determined ⚠️⚠️⚠️");
          break;
      }
    } catch (e) {
      dev.log('Error requesting notification permission: $e');
      isNotificationEnabled = false;
      isNotificationSubscribed.value = false;
    }
  }

  Future<void> _checkSubscriptionStatus() async {
    try {
      await _subscribeNotificationToTopic();
    } catch (e) {
      dev.log('Error checking subscription status: $e');
      isNotificationSubscribed.value = false;
    }
  }

  Future<void> controlNotificationPermission(BuildContext context) async {
    try {
      if (!isNotificationEnabled) {
        await permissionNotification();
      } else {
        if (isNotificationSubscribed.value) {
          ShowToast.showToastErrorTop(
              message: "unsubscribed_to_notifications".tr(context), seconds: 2);
          await _unsubscribeNotificationToTopic();
        } else {
          ShowToast.showToastSuccessTop(
              message: "subscribed_to_notifications".tr(context), seconds: 2);
          await _subscribeNotificationToTopic();
        }
      }
    } catch (e) {
      dev.log('Error controlling notification permission: $e');
    }
  }

  Future<void> _subscribeNotificationToTopic() async {
    if (topic.isEmpty) {
      dev.log('=== ⚠️⚠️⚠️ Topic is empty or missing ⚠️⚠️⚠️');
      return;
    }

    try {
      await fcm.subscribeToTopic(topic);
      isNotificationSubscribed.value = true;
      dev.log("=== 🔔🔔🔔 Subscribed to topic: $topic 🔔🔔🔔");
    } catch (e) {
      dev.log('Error subscribing to topic $topic: $e');
      isNotificationSubscribed.value = false;
    }
  }

  Future<void> _unsubscribeNotificationToTopic() async {
    if (topic.isEmpty) {
      dev.log('=== ⚠️⚠️⚠️ Topic is empty or missing ⚠️⚠️⚠️');
      return;
    }

    try {
      await fcm.unsubscribeFromTopic(topic);
      isNotificationSubscribed.value = false;
      dev.log("=== ⚠️⚠️⚠️ Unsubscribed from topic: $topic ⚠️⚠️⚠️");
    } catch (e) {
      dev.log('Error unsubscribing from topic $topic: $e');
      isNotificationSubscribed.value = true; // يبقى مشترك حتى لو فشل الإلغاء
    }
  }
}
