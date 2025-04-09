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
import 'package:shopzen/features/auth/data/models/sign_up_request_model.dart';
import 'package:shopzen/features/auth/data/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo repo;
  AuthBloc({required this.repo}) : super(_Initial()) {
    on<AuthEvent>(login);
    on<SignUpEvent>(_signUp);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FutureOr<void> login(AuthEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

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
      await repo.addUserIdToFirebase(userId: userRole.userId.toString());
      emit(AuthState.success(userRole: userRole.userRole ?? ""));
    }, failure: (error) {
      emit(AuthState.failure(failureMessage: error));
    });
  }

  FutureOr<void> _signUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await repo.signUp(
      SignUpRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text,
        imageUrl: event.imageUrl,
        userName: nameController.text.trim(),
      ),
    );

    result.when(
      success: (signupData) {
        add(const AuthEvent.login());
      },
      failure: (error) {
        emit(AuthState.failure(failureMessage: error));
      },
    );
  }
}
