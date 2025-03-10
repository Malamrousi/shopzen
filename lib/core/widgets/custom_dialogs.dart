import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/widgets/custom_button.dart';

import '../utils/styles/test_styles.dart';

class CustomDialog {
  const CustomDialog._();

  static void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey,
        title: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 20.h,
          ),
          child: Center(
              child: Text(
            textBody,
            style: AppTestStyles.font18Bold(context),
            textAlign: TextAlign.center,
          )),
        ),
        actions: [
          CustomButton(
            backgroundColor: ColorsManger.alertColorRed500,
            onPressed: onPressed,
            title: textButton1,
            bottomWidth: 320.w,
            bottomHeight: 45.h,
            borderRadius: 10,
            textStyle: AppTestStyles.font16Regular(context),
          ),
          SizedBox(height: 10.h, width: 1.w),
          CustomButton(
            backgroundColor: ColorsManger.primaryColor500,
            onPressed: () {
              context.pop();
            },
            title: textButton2,
            bottomWidth: 320.w,
            bottomHeight: 45.h,
            borderRadius: 10,
            textStyle: AppTestStyles.font16Regular(context),
          ),
        ],
      ),
    );
  }
}
