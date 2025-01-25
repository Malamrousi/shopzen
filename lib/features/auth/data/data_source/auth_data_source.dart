import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shopzen/core/services/Graphql/api_services.dart';
import 'package:shopzen/core/services/Graphql/graphql_queries/auth_queries.dart';
import 'package:shopzen/features/auth/data/models/login_request_body.dart';
import 'package:shopzen/features/auth/data/models/login_response_model.dart';
import 'package:shopzen/features/auth/data/models/user_role_model.dart';

class AuthDataSource {
  final ApiService apiService;
  const AuthDataSource({
    required this.apiService,
  });

  Future<LoginResponseModel> login(
      LoginRequestBodyModel loginRequestBodyModel) async {
    final response = await apiService.login(
        AuthQueries().loginQuery(loginRequestBodyModel: loginRequestBodyModel));
    return response;
  }

  Future<UserRoleModel> userRole(String token) async {
    final Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client=ApiService(dio);
    final response = await client.userRole();
    debugPrint('User Role Response ====> ${response.userRole}');
    return response;
  }
}
