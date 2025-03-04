import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';

import '../../../../../core/assets/assets.dart';

class CustomMainScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomMainScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(Assets.imagesUserAvatar ,
        width: 80.w,
        height: 80.h,
      ),
      title: Text(
        "hello".tr(context),
        style: AppTestStyles.font18Bold(context),
      ),
      subtitle: Text(
        "Mohammed",
        style: AppTestStyles.font16MediumPrimary700(context),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_outlined,
            size: 26.sp,
            color: context.colorThemeExtension.textColor,
          )),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
