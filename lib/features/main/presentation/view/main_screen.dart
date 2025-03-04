import 'package:flutter/material.dart';

import 'widgets/main_screen_view_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: MainScreenViewBody()));
  }
}
