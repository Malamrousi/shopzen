import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/routes/base_route.dart';
import 'package:shopzen/core/routes/page_slide_transition.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/screens/under_build_screen.dart';
import 'package:shopzen/features/auth/presentation/bloc/bloc/login_bloc.dart';
import 'package:shopzen/features/auth/presentation/view/login_screen.dart';
import 'package:shopzen/features/auth/presentation/view/sign_up_screen.dart';
import 'package:shopzen/features/on_boarding/presentation/view/on_boarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.onBoarding:
      return BaseRoute(
        page: const OnBoardingScreen(),
      );
    case RouteName.login:
      return PageSlideTransition(
        page: BlocProvider(
          create: (context) => getIt.get<LoginBloc>(),
          child: const LoginScreen(),
        ),
      );
    case RouteName.signUp:
      return BaseRoute(
        page: const SignUpScreen(),
      );
    default:
      return MaterialPageRoute(builder: (_) => PageUnderBuildScreen());
  }
}
