// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color? mainColor;
  final Color? textColor;
  const ColorExtension({this.mainColor, this.textColor});

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
      mainColor: ColorsManger.whiteColor, textColor: ColorsManger.blackColor);
  static const ColorExtension darkColor = ColorExtension(
    mainColor: ColorsManger.blackColor,
    textColor: ColorsManger.whiteColor,
  );
}
