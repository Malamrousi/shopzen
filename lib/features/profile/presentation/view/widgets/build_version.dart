import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/app_info.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/test_styles.dart';

class BuildVersion extends StatelessWidget {
  const BuildVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.smartphone_sharp,
          color: context.colorThemeExtension.textColor,
          size: 26.sp,
        ),
        horizontalSpacing(8.w),
        Text(
          "build_version".tr(context),
          style: AppTestStyles.font18Regular(context),
        ),
        Spacer(),
        FutureBuilder<String>(
          future: AppInfo.getAppInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
            return  Text(
                snapshot.data.toString(),
                style: AppTestStyles.font16Regular(context),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}
