import 'package:flutter/material.dart';
import 'package:shopzen/features/auth/presentation/view/widgets/login_view_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child:LoginViewBody() ),
    );
  }
}