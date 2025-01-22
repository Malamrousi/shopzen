import 'package:flutter/material.dart';
import 'package:shopzen/core/utils/styles/themes/color_extension.dart';
import 'package:shopzen/core/utils/styles/themes/image_extension.dart';

extension ThemeExtension on BuildContext {
    ColorExtension get colorThemeExtension => Theme.of(this).extension<ColorExtension>()!;
  ImageExtension get image => Theme.of(this).extension<ImageExtension>()!;
}