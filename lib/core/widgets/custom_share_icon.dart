import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

class CustomShareIcon extends StatelessWidget {
  const CustomShareIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.share,
        size: 26.sp,
      ),
      color: context.colorThemeExtension.textColor,
    );
  }
}
