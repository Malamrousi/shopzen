import 'package:flutter/material.dart';
import 'package:shopzen/features/auth/presentation/view/widgets/sign_up_view_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SignUpViewBody()),
        ),
      ),
    );
  }
}
