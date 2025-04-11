import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

class CustomShareIcon extends StatelessWidget {
  const CustomShareIcon({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.share,
        size: 26.sp,
      ),
      color: context.colorThemeExtension.textColor,
    );
  }
}
