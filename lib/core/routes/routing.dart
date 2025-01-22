import 'package:flutter/material.dart';
import 'package:shopzen/core/routes/base_route.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/routes/under_build_screen.dart';
import 'package:shopzen/features/on_boarding/presentation/view/on_boarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.onBoarding:
      return  BaseRoute(
        page:  const OnBoardingScreen(),
      );
    default:
      return MaterialPageRoute(builder: (_) => PageUnderBuildScreen());
  }
}
