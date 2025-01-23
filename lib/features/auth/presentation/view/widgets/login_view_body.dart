import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/core/widgets/app_text_form_filed.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w , vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "login_with_email".tr(context),
            style: AppTestStyles.font20Regular(context),
          ),
          verticalSpacing(48) ,
          Text(
            "email".tr(context),
            style: AppTestStyles.font16Medium(context),
          ),
           verticalSpacing(8) ,
          AppTextFormFiled(
            controller: TextEditingController(),
            hintText: "enter_email".tr(context),
            validator: (value) {
              return null;
            },
          ),
           verticalSpacing(16) ,
              Text(
            "password".tr(context),
            style: AppTestStyles.font16Medium(context),
          ),
           verticalSpacing(8) ,
          AppTextFormFiled(
            controller: TextEditingController(),
            hintText: "enter_password".tr(context),
            validator: (value) {
              return null;
            },
          ),
        ],
      ),
    );
  }
}