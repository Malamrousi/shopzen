import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen/core/helper/spacing.dart';

import 'package:shopzen/core/utils/styles/colors_manger.dart';

import '../../../../../core/utils/styles/test_styles.dart';

class IconTapNavBar extends StatelessWidget {
  const IconTapNavBar({
    required this.onTap,
    required this.image,
    required this.isSelected,
    required this.title,
    super.key,
  });
  final VoidCallback onTap;
  final String image;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            height: 22.h,
            width: 20.w,
            image,
            color: isSelected ? ColorsManger.primaryColor400 : Colors.grey,
          ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
          verticalSpacing(3),
          Text(
            title,
            style: AppTestStyles.font14Regular(context).copyWith(
              fontSize: 12.sp,
              color: isSelected ? ColorsManger.primaryColor400 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
