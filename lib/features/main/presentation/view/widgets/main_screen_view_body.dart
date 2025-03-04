import 'package:flutter/material.dart';
import 'package:shopzen/features/main/presentation/view/widgets/custom_main_screen_app_bar.dart';

class MainScreenViewBody extends StatelessWidget {
  const MainScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMainScreenAppBar()
      ],
    );
  }
}