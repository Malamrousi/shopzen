import 'package:flutter/material.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/themes/color_extension.dart';
import 'package:shopzen/core/utils/styles/themes/image_extension.dart';

ThemeData themeDark() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsManger.blackColor,
      extensions: const <ThemeExtension<dynamic>>[ColorExtension.darkColor , ImageExtension.darkColor]);
}

ThemeData themeLight() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsManger.whiteColor,
      extensions: const <ThemeExtension<dynamic>>[ColorExtension.lightColor , ImageExtension.lightColor]);
}
