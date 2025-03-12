

import 'package:flutter/material.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color? mainColor;
  final Color? textColor;
  final Color? bottomNavColor;
  final Color? containerShadow1;
  final Color? containerShadow2;
  final Color? containerLinear1;
  final Color? containerLinear2;

  const ColorExtension({
    this.mainColor,
    this.textColor,
    this.bottomNavColor,
    this.containerLinear1,
    this.containerLinear2,
    this.containerShadow1,
    this.containerShadow2,
  });

  @override
  ThemeExtension<ColorExtension> copyWith({Color? color}) {
    return ColorExtension(mainColor: color);
  }

  @override
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    if (other is! ColorExtension) {
      return this;
    }

    return ColorExtension(mainColor: Color.lerp(mainColor, other.mainColor, t));
  }

  static const ColorExtension lightColor = ColorExtension(
    mainColor: ColorsManger.whiteColor,
    textColor: ColorsManger.blackColor,
    bottomNavColor: ColorsManger.gray50,
    containerShadow1: ColorsManger.shadowLightSoft,
    containerShadow2: ColorsManger.shadowLightDeep,
    containerLinear1: ColorsManger.whiteColor, 
    containerLinear2: ColorsManger.gray400,   
  );

  static const ColorExtension darkColor = ColorExtension(
    mainColor: ColorsManger.blackColor,
    textColor: ColorsManger.whiteColor,
    bottomNavColor: ColorsManger.darkTealBlue,
    containerShadow1: ColorsManger.shadowDarkSoft,
    containerShadow2: ColorsManger.shadowDarkDeep,
    containerLinear1: ColorsManger.black1,   
    containerLinear2: ColorsManger.gray950,  
  );
}