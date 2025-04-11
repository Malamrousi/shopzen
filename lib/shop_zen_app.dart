import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopzen/core/app/app_localizations.dart';

import 'package:shopzen/core/cubit/app_cubit/app_cubit.dart';
import 'package:shopzen/core/app/connectivity_controller.dart';
import 'package:shopzen/core/cubit/share/share_cubit.dart';

import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/routes/routing.dart';
import 'package:shopzen/core/screens/no_network_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen/core/utils/styles/themes/app_theme.dart';

class ShopZenApp extends StatelessWidget {
  const ShopZenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt.get<AppCubit>()
                  ..changeAppThemeMode(
                    sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
                  )
                  ..getSavedLanguage(),
              ),
              BlocProvider(
                create: (context) => getIt.get<ShareCubit>(),
              ),
            ],
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    title: 'ShopZen',
                    debugShowCheckedModeBanner: false,
                    theme: cubit.isDark ? themeLight() : themeDark(),
                    locale: Locale(cubit.currentLangCode),
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    builder: (context, widget) {
                      return Scaffold(
                        body: Builder(
                          builder: (context) {
                            ConnectivityController.instance.init();
                            return widget!;
                          },
                        ),
                      );
                    },
                    navigatorKey: getIt.get<GlobalKey<NavigatorState>>(),
                    onGenerateRoute: generateRoute,
                    initialRoute:
                        SharedPref().getString(PrefKeys.isLogin) == "true"
                            ? RouteName.main
                            : RouteName.onBoarding,
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      if (deviceLocale != null) {
                        for (var locale in supportedLocales) {
                          if (deviceLocale.languageCode ==
                                  locale.languageCode &&
                              deviceLocale.countryCode == locale.countryCode) {
                            return locale;
                          }
                        }
                        for (var locale in supportedLocales) {
                          if (deviceLocale.languageCode ==
                              locale.languageCode) {
                            return locale;
                          }
                        }
                      }
                      return deviceLocale?.languageCode == ARABIC
                          ? ARABIC_LOCAL
                          : ENGLISH_LOCAL;
                    },
                  );
                },
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'No NetWork ',
            debugShowCheckedModeBanner: false,
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
