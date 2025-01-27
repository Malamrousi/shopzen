// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.g.dart';
@JsonSerializable()
class LoginModel {
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  LoginModel({
    required this.accessToken,
    required this.refreshToken,
  });
 factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

}
