import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/routes/base_route.dart';
import 'package:shopzen/core/routes/page_slide_transition.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/screens/custom_web_view.dart';
import 'package:shopzen/core/screens/under_build_screen.dart';
import 'package:shopzen/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopzen/features/auth/presentation/view/login_screen.dart';
import 'package:shopzen/features/auth/presentation/view/sign_up_screen.dart';
import 'package:shopzen/features/main/presentation/bloc/main_cubit/main_cubit_cubit.dart';
import 'package:shopzen/features/main/presentation/view/main_screen.dart';
import 'package:shopzen/features/map/presentation/view/google_map_screen.dart';
import 'package:shopzen/features/map/presentation/view/location_screen.dart';
import 'package:shopzen/features/on_boarding/presentation/view/on_boarding_screen.dart';
import 'package:shopzen/features/product_details/presentation/view/product_details.dart';

import '../../features/notification/presentation/view/notification_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final argument = settings.arguments;
  switch (settings.name) {
    case RouteName.onBoarding:
      return BaseRoute(
        page: const OnBoardingScreen(),
      );
    case RouteName.login:
      return PageSlideTransition(
        page: BlocProvider(
          create: (context) => getIt.get<AuthBloc>(),
          child: const LoginScreen(),
        ),
      );
    case RouteName.signUp:
      return BaseRoute(
        page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt.get<UploadImageCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<AuthBloc>(),
            ),
          ],
          child: const SignUpScreen(),
        ),
      );
    case RouteName.main:
      return BaseRoute(
        page: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => getIt.get<MainCubit>(),
          )
        ], child: const MainScreen()),
      );
    case RouteName.location:
      return BaseRoute(
        page: const LocationScreen(),
      );
    case RouteName.map:
      return BaseRoute(
        page: const GoogleMapScreen(),
      );
    case RouteName.webView:
      return BaseRoute(
        page: CustomWebView(
          url: argument as String,
        ),
      );
    case RouteName.productDetails:
      return BaseRoute(
        page: ProductDetails(
          productId: argument as int,
        ),
      );
    case RouteName.notification:
      return BaseRoute(
        page: NotificationScreen(),
      );
    default:
      return MaterialPageRoute(builder: (_) => PageUnderBuildScreen());
  }
}
