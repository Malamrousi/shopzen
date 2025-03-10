import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shopzen/core/api/api_services.dart';
import 'package:shopzen/features/auth/data/models/user_role_model.dart';

class ProfileDataSource {
  final ApiService apiService;

  ProfileDataSource({required this.apiService});

  Future<UserRoleModel> getUserInfo(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    debugPrint('User Role => ${response.userRole}');
    return response;
  }
}
