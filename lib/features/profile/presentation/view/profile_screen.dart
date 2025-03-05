import 'package:flutter/material.dart';
import 'package:shopzen/features/profile/presentation/view/widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProfileScreenBody(),
    );
  }
}
