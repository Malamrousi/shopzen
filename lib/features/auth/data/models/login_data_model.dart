// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/features/auth/data/models/login_model.dart';
part 'login_data_model.g.dart';
@JsonSerializable()
class LoginDataModel {
  LoginDataModel(this.login);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  LoginModel login;
}
