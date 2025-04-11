import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen/core/utils/app_string.dart';
import 'package:shopzen/features/notification/data/model/notification_model.dart';

class NotificationController {
  final notificationDataBase = FirebaseFirestore.instance
      .collection(userCollection)
      .doc(SharedPref().getInt(PrefKeys.userId).toString())
      .collection(notificationCollection)
      .orderBy("date", descending: true);

  Stream<List<NotificationModel>> getNotification() {
    return notificationDataBase.snapshots().map((value) {
      return value.docs.map((doc) {
        return NotificationModel.fromJson(doc.data());
      }).toList();
    });
  }
}
