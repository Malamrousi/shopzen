
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/core/widgets/custom_button.dart';

import '../../../../../core/animations/animate_do.dart';

class SaveFilterButton extends StatelessWidget {
  const SaveFilterButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 300,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: CustomButton(
          onPressed: onTap,
          bottomHeight: 30.h,
          bottomWidth: 100.w,
          title: "save".tr(context),
          textStyle: AppTestStyles.font16BoldWhiteColor(context),
        ),
      ),
    );
  }
}