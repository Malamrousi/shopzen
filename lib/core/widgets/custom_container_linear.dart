import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

class CustomContainerLinear extends StatelessWidget {
  const CustomContainerLinear({
    required this.height,
    required this.width,
    required this.child,
    super.key,
  });

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [
            context.colorThemeExtension.containerLinear1!.withOpacity(0.8),
            context.colorThemeExtension.containerLinear2!.withOpacity(0.8),
          ],
          begin: Alignment.centerLeft,  
          end: Alignment.centerRight,   
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorThemeExtension.containerShadow1!.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            color: context.colorThemeExtension.containerShadow2!.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}