import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/features/auth/data/models/sign_up_model.dart';


part 'sign_up_data_model.g.dart';

@JsonSerializable()
class SignUpDataModel {
  final SignUpModel addUser;

  SignUpDataModel({required this.addUser});

  static fromJson(Map<String, dynamic> json) {}
}
