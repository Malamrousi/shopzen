// import 'package:flutter/material.dart';
// import 'package:fruit_hub/core/routing/route_name.dart';
// import 'package:fruit_hub/features/auth/presentation/view/login_view.dart';
// import 'package:fruit_hub/features/auth/presentation/view/sign_up_view.dart';
// import 'package:fruit_hub/features/home/presentation/view/home_view.dart';
// import 'package:fruit_hub/features/splash/presentation/view/splash_view.dart';

// import '../../features/best_selling/presentation/view/best_selling_view.dart';
// import '../../features/on_boardibg/presentation/view/on_boarding_view.dart';

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case RouteName.splash:
//       return MaterialPageRoute(
//         builder: (_) => const SplashView(),
//       );
//     case RouteName.onBoarding:
//       return MaterialPageRoute(
//         builder: (_) => const OnBoardingView(),
//       );
//     case RouteName.login:
//       return MaterialPageRoute(
//         builder: (_) => const LoginView(),
//       );
//     case RouteName.signUp:
//       return MaterialPageRoute(
//         builder: (_) => const SignUpView(),
//       );
//     case RouteName.home:
//       return MaterialPageRoute(
//         builder: (_) => const HomeView(),
//       );
//           case RouteName.bestSelling:
//       return MaterialPageRoute(
//         builder: (_) => const BestSellingView(),
//       );
//     default:
//       return MaterialPageRoute(
//         builder: (_) => Scaffold(
//           body: Text('No Routes defied to ${settings.name}'),
//         ),
//       );
//   }
// }