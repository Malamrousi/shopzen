
import 'package:shopzen/core/api/api_result.dart';
import 'package:shopzen/features/auth/data/data_source/auth_data_source.dart';
import 'package:shopzen/features/auth/data/models/login_request_body.dart';
import 'package:shopzen/features/auth/data/models/login_response_model.dart';
import 'package:shopzen/features/auth/data/models/user_role_model.dart';

import '../models/sign_up_request_model.dart';
import '../models/sign_up_response_model.dart';

class AuthRepo {
  final AuthDataSource authDataSource;
  const AuthRepo({required this.authDataSource});

  Future<ApiResult<LoginResponseModel>> login(
      LoginRequestBodyModel loginRequestBodyModel) async {
    try {
      final response = await authDataSource.login(loginRequestBodyModel: loginRequestBodyModel);
      return  ApiResult.success(response);
    } catch (error) {
      return  ApiResult.failure(error.toString());
    }
  }

  Future<UserRoleModel> userRole(String token) async {
    final response = await authDataSource.userRole(token);
    return response;
  }

  Future<ApiResult<SignUpResponseModel>> signUp(SignUpRequestModel body) async {
    try {
      final response = await authDataSource.signUp(body: body);
      return  ApiResult.success(response);
    } catch (error) {
      return  ApiResult.failure(error.toString());
    }
  }
}
