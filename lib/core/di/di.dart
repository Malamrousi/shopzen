// lib/core/di/di.dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzen/core/cubit/app_cubit/app_cubit.dart';
import 'package:shopzen/core/api/api_services.dart';
import 'package:shopzen/core/api/dio_factory.dart';
import 'package:shopzen/features/auth/data/data_source/auth_data_source.dart';
import 'package:shopzen/features/auth/data/repo/auth_repo.dart';
import 'package:shopzen/features/auth/presentation/bloc/login_bloc/login_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final dio = DioFactory.getDio();
  final navKey = GlobalKey<NavigatorState>();
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // App Preferences Instance

  getIt.registerFactory<AppCubit>(() => AppCubit()); //
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AuthDataSource>(
      () => AuthDataSource(apiService: getIt.get<ApiService>()));
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepo(authDataSource: getIt.get<AuthDataSource>()));

  getIt
      .registerFactory<LoginBloc>(() => LoginBloc(repo: getIt.get<AuthRepo>()));
  getIt.registerSingleton<GlobalKey<NavigatorState>>(navKey);
}
