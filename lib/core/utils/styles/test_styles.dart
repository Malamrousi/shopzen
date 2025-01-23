import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_context.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/font_family.dart';
import 'package:shopzen/core/utils/font_weight_manger.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';

class AppTestStyles {
  static TextStyle font30Bold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightManger.bold,
    color: AppContext.context.colorThemeExtension.mainColor,
    fontFamily: FontFamily.getFontFamily(),
  );
    static TextStyle font18Bold= TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightManger.medium,
    color: AppContext.context.colorThemeExtension.mainColor,
    fontFamily: FontFamily.getFontFamily(),
  );
      static TextStyle font20Bold= TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightManger.medium,
    color: ColorsManger.whiteColor,
    fontFamily: FontFamily.getFontFamily(),
  );
        static TextStyle font16Regular =TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightManger.regular,
    color: ColorsManger.whiteColor,
    fontFamily: FontFamily.getFontFamily(),
  );
}
