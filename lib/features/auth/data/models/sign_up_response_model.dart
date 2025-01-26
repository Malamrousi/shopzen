// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopzen/features/auth/data/models/sign_up_data_model.dart';


part"sign_up_response_model.g.dart";

@JsonSerializable()


class SignUpResponseModel {
 SignUpDataModel? data; 
  SignUpResponseModel({
    this.data,
  });
 
    factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => _$SignUpResponseModelFromJson(json);

}
