import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/notification/firebase_cloud _messaging.dart';
import '../../../../../core/utils/styles/colors_manger.dart';
import '../../../../../core/utils/styles/test_styles.dart';

class NotificationChange extends StatelessWidget {
  const NotificationChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications_active_outlined,
          color: context.colorThemeExtension.textColor,
          size: 26.sp,
        ),
        horizontalSpacing(8.w),
        Text(
          "notification".tr(context),
          style: AppTestStyles.font18Regular(context),
        ),
        Spacer(),
        ValueListenableBuilder<bool>(
          valueListenable:
              FirebaseCloudMessaging.instance.isNotificationSubscribed,
          builder: (context, isSubscribed, child) {
            return Transform.scale(
          scale: 0.75,
              child: Switch.adaptive(
                inactiveTrackColor: const Color(0xff262626),
                activeColor: ColorsManger.alertColorGreen500,
                value: isSubscribed,
                onChanged: (newValue) async {
                  try {
                    await FirebaseCloudMessaging.instance
                        .controlNotificationPermission(context);
                  } catch (e) {
                    log('Error toggling notification subscription: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Failed to toggle notification subscription: $e'),
                      ),
                    );
                  }
                },
              ),
            );
          },
        )
      ],
    );
  }
}
