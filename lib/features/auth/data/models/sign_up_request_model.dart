import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  final String? email;

  final String? password;
  @JsonKey(name: 'name')
  final String?userName;
  @JsonKey(name: 'avatar')
  final String? imageUrl;

  const SignUpRequestModel(
      {required this.email,
      required this.password,
      required this.userName,
      required this.imageUrl});

  

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
