import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen/core/assets/assets.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/test_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      onTap: () {},
      leading: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorsManger.primaryColor400, width: 1.5),
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.svgNotificationIcon,
            color: ColorsManger.primaryColor800,
            height: 24.h,
            width: 24.w,
          ),
        ),
      ),
      title: Text(
        'June 15, 2024',
        style: AppTestStyles.font16BoldThemeColor(context),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacing(8.h),
          Text(
            '30% Special Discount!',
            style: AppTestStyles.font14BoldThemeColor(context),
          ),
          verticalSpacing(5.h),
          Text(
            'You have top up your e-wallet.t',
            style: AppTestStyles.font14Regular(context),
          ),
         
        ],
      ),
      trailing: Icon(
        Icons.delete,
        color: ColorsManger.alertColorRed500,
      ),
    );
  }
}
