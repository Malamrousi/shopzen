// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      notificationId: json['notification_Id'] as String,
      notificationTitle: json['title'] as String,
      notificationBody: json['body'] as String,
      notificationDate: json['date'] as String,
      isSeen: json['isSeen'] as bool,
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'notification_Id': instance.notificationId,
      'title': instance.notificationTitle,
      'body': instance.notificationBody,
      'date': instance.notificationDate,
      'isSeen': instance.isSeen,
      'productId': instance.productId,
    };
