import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopzen/core/app/app_localizations_setup.dart';
import 'package:shopzen/core/app/app_prefs.dart';
import 'package:shopzen/core/app/connectivity_controller.dart';
import 'package:shopzen/core/bloc/change_language/change_language_bloc.dart';
import 'package:shopzen/core/bloc/change_language/change_language_event.dart';
import 'package:shopzen/core/bloc/change_language/change_language_state.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/routes/routing.dart';
import 'package:shopzen/core/screens/no_network_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/utils/styles/themes/app_theme.dart';

class ShopZenApp extends StatelessWidget {
  const ShopZenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc(
        appPreferences: getIt.get<AppPreferences>(),  
      )..add(GetCurrentLanguage()),
      child: ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnected,
        builder: (_, hasConnection, __) {
          if (hasConnection) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, languageState) {
                  return MaterialApp(
                    title: 'ShopZen',
                    debugShowCheckedModeBanner: false,
                    theme: themeLight(),
                    builder: (context, widget) {
                      return GestureDetector(
                        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                        child: Scaffold(
                          body: Builder(
                            builder: (context) {
                              ConnectivityController.instance.init();
                              return widget!;
                            },
                          ),
                        ),
                      );
                    },
                    locale: languageState.locale,
                    supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      if (deviceLocale != null) {
                        for (var locale in supportedLocales) {
                          if (deviceLocale.languageCode == locale.languageCode &&
                              deviceLocale.countryCode == locale.countryCode) {
                            return locale;
                          }
                        }
                        for (var locale in supportedLocales) {
                          if (deviceLocale.languageCode == locale.languageCode) {
                            return locale;
                          }
                        }
                      }
                      return deviceLocale?.languageCode == ARABIC
                          ? ARABIC_LOCAL
                          : ENGLISH_LOCAL;
                    },
                    onGenerateRoute: generateRoute,
                    initialRoute: RouteName.onBoarding,
                  );
                },
              ),
            );
          } else {
            return MaterialApp(
              title: 'No Network',
              debugShowCheckedModeBanner: false,
              theme: themeLight(),
              home: const NoNetworkScreen(),
            );
          }
        },
      ),
    );
  }
}