import 'package:flutter/material.dart';

import 'widgets/notification_app_bar.dart';
import 'widgets/notification_screen_view_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppBar(),
      body: const NotificationScreenViewBody(),
    );
  }
}
