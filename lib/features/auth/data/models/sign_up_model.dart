import 'package:freezed_annotation/freezed_annotation.dart';
part'sign_up_model.g.dart';


@JsonSerializable()
class SignUpModel {
   @JsonKey(name: "id")
  String? userid;
  @JsonKey(name: "email")
  String? email;
  SignUpModel({
    this.userid,
    this.email,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}