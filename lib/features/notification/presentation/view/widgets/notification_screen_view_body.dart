import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/features/notification/presentation/view/widgets/notification_item.dart';

import '../../../../../core/utils/styles/colors_manger.dart';

class NotificationScreenViewBody extends StatelessWidget {
  const NotificationScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return NotificationItem();
          },
          separatorBuilder: (context, index) {
            return Column(
              children: [
                verticalSpacing(10.h),
                Container(
                  height: 1.h,
                  color: ColorsManger.gray300,
                ),
              ],
            );
          },
          itemCount: 10),
    );
  }
}
