import 'package:flutter/material.dart';
import 'package:shopzen/core/app/connectivity_controller.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/routes/routing.dart';
import 'package:shopzen/core/screens/no_network_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/utils/styles/themes/app_theme.dart';

class ShopZenApp extends StatelessWidget {
  const ShopZenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'ShopZen',
              debugShowCheckedModeBanner: false,
              theme: themeLight(),
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
              
             onGenerateRoute:generateRoute ,
             initialRoute: RouteName.onBoarding,
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
