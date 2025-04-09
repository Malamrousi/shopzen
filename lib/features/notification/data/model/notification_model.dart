// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_model.g.dart';
@JsonSerializable()
class NotificationModel {
  @JsonKey(name: 'notification_Id')
  final String NotificationId;
  @JsonKey(name: 'title')
  final String NotificationTitle;
  @JsonKey(name: 'body')
  final String NotificationBody;
  @JsonKey(name: 'date')
  final String NotificationDate;
  final bool isSeen;
  final String productId;
  NotificationModel({
    required this.NotificationId,
    required this.NotificationTitle,
    required this.NotificationBody,
    required this.NotificationDate,
    required this.isSeen,
    required this.productId,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
