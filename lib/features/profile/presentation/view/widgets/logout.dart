import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/app_logout.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/test_styles.dart';
import '../../../../../core/widgets/custom_dialogs.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.logout_outlined,
          color: context.colorThemeExtension.textColor,
          size: 26.sp,
        ),
        horizontalSpacing(8.w),
        Text(
          "logout".tr(context),
          style: AppTestStyles.font18Regular(context),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            CustomDialog.twoButtonDialog(
                context: context,
                textBody: "do_you_want_to_logout_from_app".tr(context),
                textButton1: "sure".tr(context),
                textButton2: "cancel".tr(context),
                onPressed: () async {
                  context.pop();
                  await AppLogout().logout();
                 },
                isLoading: false);
          },
          child: Row(
            children: [
              Text(
                "logout".tr(context).toLowerCase(),
                style: AppTestStyles.font16RegularWhiteColor(context),
              ),
              horizontalSpacing(5.w),
              Icon(
                Icons.arrow_forward_ios,
                color: context.colorThemeExtension.textColor,
                size: 22.sp,
              ),
            ],
          ),
        )
      ],
    );
  }
}
