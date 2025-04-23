import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.borderRadius,
      this.textStyle,
      this.bottomHeight,
      this.bottomWidth,
      this.borderColor, this.backgroundColor});
  final double? borderRadius;

  final String title;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? bottomHeight;
  final double? bottomWidth;

  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll<Size>(
            Size(bottomWidth ?? double.maxFinite, bottomHeight ?? 48.h)),
        backgroundColor:  WidgetStatePropertyAll<Color>(
       backgroundColor ??   ColorsManger.primaryColor700),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            side: BorderSide(color: borderColor ?? Colors.transparent ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle ?? AppTestStyles.font16BoldWhiteColor(context),
      ),
    );
  }
}