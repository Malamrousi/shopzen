import 'package:flutter/material.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
   body:SingleChildScrollView(
     child: SafeArea(child: SizedBox(
                height: MediaQuery.of(context).size.height,
      child: OnBoardingViewBody())),
   ) ,
    );
  }
}