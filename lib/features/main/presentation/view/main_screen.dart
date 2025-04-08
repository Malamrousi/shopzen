import 'package:flutter/material.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/notification/local_notifications.dart';
import 'package:shopzen/features/main/presentation/view/widgets/custom_main_screen_app_bar.dart';

import '../../../../core/routes/route_name.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/main_screen_view_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void listenToNotification() {
    LocalNotifications.streamController.stream.listen((event) {
      context.pushNamed(RouteName.productDetails,
          arguments: int.parse(event.payload.toString()));
    });
  }

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
