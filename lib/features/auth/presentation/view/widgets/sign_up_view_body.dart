import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/app/app_regex.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/widgets/app_text_form_filed.dart';
import 'package:shopzen/core/widgets/custom_button.dart';
import 'package:shopzen/features/auth/presentation/view/widgets/custom_text_rich.dart';

import '../../../../../core/utils/styles/test_styles.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "sign_up_with_email".tr(context),
            style: AppTestStyles.font20Bold(context),
          ),
          verticalSpacing(48),
          Text(
            "email".tr(context),
            style: AppTestStyles.font16Medium(context),
          ),
          verticalSpacing(8),
          AppTextFormFiled(
            controller: TextEditingController(),
            hintText: "enter_email".tr(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please_enter_email".tr(context);
              } else if (AppRegex.isPasswordValid(value)) {
                return "please_enter_valid_email".tr(context);
              }
              return null;
            },
          ),
          verticalSpacing(16),
          Text(
            "password".tr(context),
            style: AppTestStyles.font16Medium(context),
          ),
          verticalSpacing(8),
          AppTextFormFiled(
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: ColorsManger.gray600,
              ),
            ),
            controller: TextEditingController(),
            hintText: "enter_password".tr(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please_enter_password".tr(context);
              } else if (AppRegex.isPasswordValid(value)) {
                return "please_enter_valid_password".tr(context);
              }
              return null;
            },
          ),
          verticalSpacing(78),
          CustomButton(
            onPressed: () {},
            title: "signup".tr(context),
            backgroundColor: ColorsManger.primaryColor400,
            textStyle: AppTestStyles.font16Regular(context),
          ),
          Spacer(),
          Center(
            child: CustomTextRich(
                  routeName: RouteName.login,
              tittle: "have_an_account".tr(context),
              authText: "login".tr(context),
            ),
          ),
          verticalSpacing(78),
        ],
      ),
    );
  }
}
