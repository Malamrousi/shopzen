// lib/core/di/di.dart
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzen/core/cubit/app_cubit/app_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // App Preferences Instance

  getIt.registerFactory<AppCubit>(() => AppCubit());
}
