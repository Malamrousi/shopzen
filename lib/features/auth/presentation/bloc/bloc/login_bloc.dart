import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/core/secure_storage/secure_storage_keys.dart';
import 'package:shopzen/core/secure_storage/secure_storage_service.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen/features/auth/data/models/login_request_body.dart';
import 'package:shopzen/features/auth/data/repo/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo repo;
  LoginBloc({required this.repo}) : super(_Initial()) {
    on<LoginEvent>(login);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FutureOr<void> login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState.loading());

    final result = await repo.login(LoginRequestBodyModel(
        email: emailController.text, password: passwordController.text));

    await result.when(success: (loginData) async {
      final userRole =
          await repo.userRole(loginData.data.login.accessToken ?? "");
      await SharedPref().setInt(PrefKeys.userId, userRole.userId ?? 0);
      await SecureStorageService().writeSecureData(
          SecureStorageKeys.accessToken,
          loginData.data.login.accessToken ?? "");
      log("Token ${loginData.data.login.accessToken}");
      emit(LoginState.success(userRole: userRole.userRole ?? ""));
    }, failure: (error) {
      emit(LoginState.failure(failureMessage: error));
    });
  }
}
