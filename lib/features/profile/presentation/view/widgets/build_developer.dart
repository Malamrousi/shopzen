import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/utils/styles/test_styles.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Icon(
              Icons.developer_board,
              color: context.colorThemeExtension.textColor,
              size: 26.sp,
            ),
            horizontalSpacing(8.w),
            Text(
              "build_developer".tr(context),
              style: AppTestStyles.font18Regular(context),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                context.pushNamed(RouteName.webView ,
                arguments: "https://www.linkedin.com/in/mohammed-alamrousi/");
              },
              child: Row(
                children: [
                  Text(
                    "shop_zen".tr(context),
                    style: AppTestStyles.font16Regular(context),
                  ),
                  horizontalSpacing(5.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.colorThemeExtension.textColor,
                    size: 24.sp,
                  ),
                ],
              ),
            )
          ],
        );
  }
}