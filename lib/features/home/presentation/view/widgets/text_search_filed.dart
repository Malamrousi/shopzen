import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/extension.dart';

import '../../../../../core/routes/route_name.dart';
import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../core/utils/styles/colors_manger.dart';
import '../../../../../core/utils/styles/test_styles.dart';

class TextSearchFiled extends StatelessWidget {
  const TextSearchFiled({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return TextField(
      readOnly: true,
      showCursor: false,
      onTap: () {
        context.pushNamed(RouteName.search);
      },
      decoration: InputDecoration(
        hintText: "find_your_favorite_items".tr(context),
        hintStyle: AppTestStyles.font16RegularWhiteColor(context),
        prefixIcon: Icon(
          Icons.search_outlined,
          color: Colors.grey,
          size: 26.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(color: ColorsManger.gray500, width: .5),
        ),
        filled: true,
        fillColor: isDark ? ColorsManger.whiteColor : ColorsManger.blackColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      ),
    );
  }
}
