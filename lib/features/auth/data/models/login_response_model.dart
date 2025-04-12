// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/features/auth/data/models/login_data_model.dart';
part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel {
  final LoginDataModel data;
  LoginResponseModel({
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
    Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
