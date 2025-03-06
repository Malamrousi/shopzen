// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_model.g.dart';
@JsonSerializable()
class UserRoleModel {
  @JsonKey(name: "role")
  final String? userRole;
  @JsonKey(name: "id")
  final int? userId;
  @JsonKey(name:"email" )
  final String? email;
  @JsonKey(name:"name" )
  final String? name;
  @JsonKey(name:"avatar" )
  final String? userImage;

  UserRoleModel( {
    required this.userRole,
    required this.userId,
    this.email, this.name, this.userImage, 
  });
   factory UserRoleModel.fromJson(Map<String, dynamic> json) => _$UserRoleModelFromJson(json);
}

