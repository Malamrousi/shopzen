import 'package:flutter/material.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text('On Boarding Screen',
        style: TextStyle(
          color: context.colorThemeExtension.mainColor,
          fontSize: 30,
        ),
        ),),
    );
  }
}