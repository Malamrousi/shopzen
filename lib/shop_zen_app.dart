import 'package:flutter/material.dart';
import 'package:shopzen/core/app/connectivity_controller.dart';
import 'package:shopzen/core/screens/no_network_screen.dart';

class ShopZenApp extends StatelessWidget {
  const ShopZenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return MaterialApp(
            title: 'ShopZen',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
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
            home: Scaffold(
              appBar: AppBar(
                title: const Text('ShopZen'),
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
