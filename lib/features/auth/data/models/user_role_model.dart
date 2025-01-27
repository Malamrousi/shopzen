// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_model.g.dart';
@JsonSerializable()
class UserRoleModel {
  @JsonKey(name: "role")
  final String? userRole;
  @JsonKey(name: "id")
  final int? userId;

  UserRoleModel( {
    required this.userRole,
    required this.userId
  });
   factory UserRoleModel.fromJson(Map<String, dynamic> json) => _$UserRoleModelFromJson(json);
}
