import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';

import '../../../../../core/animations/animate_do.dart';


class CustomMainScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomMainScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.colorThemeExtension.mainColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomFadeInRight(
            duration: 800,
            child: Column(
              children: [
                Text(
                "hello".tr(context),
                  style: AppTestStyles.font20Bold(context),
                ),
                Text(
                  "Mohammed",
                  style: AppTestStyles.font16Regular(context),
                ),
              ],
            ),
          ),
          CustomFadeInLeft(
            duration: 800,
            child: Center(
              child:  IconButton(onPressed: () {},
               icon: Icon(
                 Icons.notifications_none_rounded,
                 color: context.colorThemeExtension.textColor,
                 size: 26.sp,
               )
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}