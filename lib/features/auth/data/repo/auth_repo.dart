import 'package:shopzen/core/services/Graphql/api_result.dart';
import 'package:shopzen/features/auth/data/data_source/auth_data_source.dart';
import 'package:shopzen/features/auth/data/models/login_request_body.dart';
import 'package:shopzen/features/auth/data/models/login_response_model.dart';
import 'package:shopzen/features/auth/data/models/user_role_model.dart';

class AuthRepo {
  final AuthDataSource authDataSource;
  const AuthRepo({required this.authDataSource});

  Future<ApiResult<LoginResponseModel>> login(
      LoginRequestBodyModel loginRequestBodyModel) async {
    try {
      final response = await authDataSource.login(loginRequestBodyModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure("please try again, we have error");
    }
  }

  Future<UserRoleModel> userRole(String token) async {
    final response = await authDataSource.userRole(token);
    return response;
  }
}
