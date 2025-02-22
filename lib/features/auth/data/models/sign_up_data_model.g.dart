// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpDataModel _$SignUpDataModelFromJson(Map<String, dynamic> json) =>
    SignUpDataModel(
      addUser: SignUpModel.fromJson(json['addUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpDataModelToJson(SignUpDataModel instance) =>
    <String, dynamic>{
      'addUser': instance.addUser,
    };
