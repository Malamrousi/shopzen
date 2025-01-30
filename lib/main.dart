import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/app/bloc_observer.dart';
import 'package:shopzen/core/app/env_variables.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/secure_storage/secure_storage_service.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen/firebase_options.dart';
import 'package:shopzen/shop_zen_app.dart';

void main() async {
  await EnvVariables.instance.init(type: EnvType.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPref().instantiatePreferences();

  await SecureStorageService().instantiateSecureStorage();
  final location = await SharedPref().getString(PrefKeys.location);
  if (location != null) {
    print("Location: $location");
  } else {
    print("location is null");
  }
  Bloc.observer = AppBlocObserver();

  setupDependencies();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const ShopZenApp());
  });
}
