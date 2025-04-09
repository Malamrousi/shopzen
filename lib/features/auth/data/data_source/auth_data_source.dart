import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shopzen/core/utils/app_string.dart';
import 'package:shopzen/features/auth/data/models/login_response_model.dart';
import 'package:shopzen/features/auth/data/models/sign_up_request_model.dart';
import 'package:shopzen/features/auth/data/models/user_role_model.dart';

import '../../../../core/api/Graphql/graphql_queries/auth_queries.dart';
import '../../../../core/api/api_services.dart';
import '../models/login_request_body.dart';
import '../models/sign_up_response_model.dart';

class AuthDataSource {
  final ApiService apiService;
  const AuthDataSource({
    required this.apiService,
  });

  //Login
  Future<LoginResponseModel> login(
      {required LoginRequestBodyModel loginRequestBodyModel}) async {
    final response = await apiService
        .login(AuthQueries().loginMapQuery(body: loginRequestBodyModel));
    return response;
  }

  //UserRole
  Future<UserRoleModel> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    debugPrint('User Role => ${response.userRole}');
    return response;
  }

  //signUp
  Future<SignUpResponseModel> signUp({required SignUpRequestModel body}) async {
    final response =
        await apiService.signup(AuthQueries().signUpMapQuery(body: body));
    return response;
  }

  Future<void> addUserIdToFirebase({required String userId}) async {
await FirebaseFirestore.instance.collection(userCollection).doc(userId).set({});
       
  }
}
