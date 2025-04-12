import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_model.g.dart';
@JsonSerializable()
class NotificationModel {
  @JsonKey(name: 'notification_Id')
  final String notificationId;
  @JsonKey(name: 'title')
  final String notificationTitle;
  @JsonKey(name: 'body')
  final String notificationBody;
  @JsonKey(name: 'date')
  final String notificationDate;
  final bool isSeen;
  final String productId;
  NotificationModel({
    required this.notificationId,
    required this.notificationTitle,
    required this.notificationBody,
    required this.notificationDate,
    required this.isSeen,
    required this.productId,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}