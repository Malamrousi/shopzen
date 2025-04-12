import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

import '../../../../../core/utils/styles/test_styles.dart';

class NotificationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        backgroundColor: context.colorThemeExtension.mainColor,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'notification'.tr(context),
          style: AppTestStyles.font20Bold(context),
        ),
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back_ios,
            color: context.colorThemeExtension.textColor,
          ),
          onPressed: () =>context.pop(),
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size(double.maxFinite, 70.h);
}