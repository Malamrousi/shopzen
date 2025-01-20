import 'package:flutter/material.dart';

class ShopZenApp extends StatelessWidget {
  const ShopZenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopZen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ShopZen'),
        ),
        body: const Center(
          child: Text('Welcome to ShopZen!'),
        ),
      ),
    );
  }
}