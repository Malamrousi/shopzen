import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/widgets/custom_button.dart';


class SearchNamePriceButton extends StatelessWidget {
  const SearchNamePriceButton({
    required this.isSelected,
    required this.onTap,
    required this.title,
    super.key,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onTap,
      bottomHeight: 40.h,
      bottomWidth: 150.w,
      title: title,
      borderRadius: 8.r,
    );
  }
}
