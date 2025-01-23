import 'package:flutter/material.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/themes/color_extension.dart';
import 'package:shopzen/core/utils/styles/themes/image_extension.dart';

import '../../font_family.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsManger.blackColor,
    extensions: const <ThemeExtension<dynamic>>[
      ColorExtension.darkColor,
      ImageExtension.darkColor
    ],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: ColorsManger.blackColor,
      fontFamily: FontFamily.getFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsManger.whiteColor,
      extensions: const <ThemeExtension<dynamic>>[
        ColorExtension.lightColor,
        ImageExtension.lightColor
      ],
      useMaterial3: true,
      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: ColorsManger.blackColor,
        fontFamily: FontFamily.getFontFamily(),
        ),
      ),
      );
}
