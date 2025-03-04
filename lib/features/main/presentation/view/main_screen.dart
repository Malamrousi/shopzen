import 'package:flutter/material.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'dart:developer' as dev;
import '../../../../core/notification/firebase_cloud _messaging.dart';
import '../../../../core/utils/styles/test_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Main Screen',
              style: AppTestStyles.font20Bold(context),
            ),
            verticalSpacing(20),
     ValueListenableBuilder<bool>(
  valueListenable: FirebaseCloudMessaging.instance.isNotificationSubscribed,
  builder: (context, isSubscribed, child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isSubscribed ? "Subscribed" : "Not Subscribed",
          style: AppTestStyles.font16Regular(context),
        ),
        horizontalSpacing(  20),
        Transform.scale(
          scale: 1.4,
          child: Switch.adaptive(
            activeColor: ColorsManger.alertColorGreen500,
            inactiveTrackColor: ColorsManger.primaryColor400,
            value: isSubscribed,
            onChanged: (newValue) async {
              try {
                await FirebaseCloudMessaging.instance.controlNotificationPermission();
              } catch (e) {
                dev.log('Error toggling notification subscription: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to toggle notification subscription: $e')),
                );
              }
            },
          ),
        ),
      ],
    );
  },
)
          ],
        ),
      ),
    );
  }
}
