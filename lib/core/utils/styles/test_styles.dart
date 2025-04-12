import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/font_family.dart';
import 'package:shopzen/core/utils/font_weight_manger.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';

class  AppTestStyles {
  static TextStyle font30Bold(BuildContext context) => TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeightManger.bold,
        color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );
  static TextStyle font18Bold(BuildContext context) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightManger.bold,
        color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font20BoldWhiteColor(BuildContext context) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightManger.bold,
        color: ColorsManger.whiteColor,
        fontFamily: FontFamily.getFontFamily(),
      );
  static TextStyle font16RegularWhiteColor(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.whiteColor,
        fontFamily: FontFamily.getFontFamily(),
      );
        static TextStyle font16BoldWhiteColor(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManger.bold,
        color: ColorsManger.whiteColor,
        fontFamily: FontFamily.getFontFamily(),
      );
        static TextStyle font16BoldThemeColor(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManger.bold,
        color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );
         static TextStyle font14BoldThemeColor(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightManger.bold,
        color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );
       static TextStyle font16RegularThemeColor(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManger.regular,
        color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );
  static TextStyle font20Bold(BuildContext context) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightManger.bold,
        color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );
        static TextStyle font18Regular(BuildContext context) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightManger.regular,
        color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font16Medium(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManger.medium,
        color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );
       static TextStyle font16MediumPrimary700(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManger.medium,
        color: ColorsManger.primaryColor700,
        fontFamily: FontFamily.getFontFamily(),
      );
      static TextStyle font18BoldPrimary400(BuildContext context) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightManger.bold,
        color: ColorsManger.primaryColor400,
        fontFamily: FontFamily.getFontFamily(),
      );
          static TextStyle font24Bold(BuildContext context) => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightManger.bold,
         color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );

          static TextStyle font14Regular(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightManger.regular,
         color: context.colorThemeExtension.textColor,
        fontFamily: FontFamily.getFontFamily(),
      );
}
