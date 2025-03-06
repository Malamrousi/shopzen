import 'package:flutter/widgets.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/routes/route_name.dart';

import '../shared_pref/shared_pref.dart';
import '../shared_pref/shared_prefs_key.dart';

class AppLogout {
  factory AppLogout() {
    return _instance;
  }

  AppLogout._();

  static final AppLogout _instance = AppLogout._();

  Future<void> logout() async {
    final context =
        getIt.get<GlobalKey<NavigatorState>>().currentState!.context;
    await SharedPref().removePreference(PrefKeys.accessToken);
    await SharedPref().removePreference(PrefKeys.userId);
    if (context.mounted) return;
    await context.pushNamedAndRemoveUntil(RouteName.login);
  }
}
