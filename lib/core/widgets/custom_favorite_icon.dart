import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

class CustomFavoriteIcon extends StatelessWidget {
  const CustomFavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.favorite_border_outlined,
        size: 26.sp,
      ),
      color: context.colorThemeExtension.textColor,
    );
  }
}
