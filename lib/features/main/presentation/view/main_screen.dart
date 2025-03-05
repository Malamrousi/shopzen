import 'package:flutter/material.dart';
import 'package:shopzen/features/main/presentation/view/widgets/custom_main_screen_app_bar.dart';

import 'widgets/bottom_nav_bar.dart';
import 'widgets/main_screen_view_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainScreenAppBar(),
      body: SafeArea(
        child: MainScreenViewBody(),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
