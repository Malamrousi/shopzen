// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      NotificationId: json['notification_Id'] as String,
      NotificationTitle: json['title'] as String,
      NotificationBody: json['body'] as String,
      NotificationDate: json['date'] as String,
      isSeen: json['isSeen'] as bool,
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'notification_Id': instance.NotificationId,
      'title': instance.NotificationTitle,
      'body': instance.NotificationBody,
      'date': instance.NotificationDate,
      'isSeen': instance.isSeen,
      'productId': instance.productId,
    };
