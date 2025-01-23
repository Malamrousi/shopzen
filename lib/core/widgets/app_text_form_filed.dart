
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';

import '../shared_pref/shared_prefs_key.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputTextStyle,
      this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.fillColor,
      this.controller,
      required this.validator});
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
          filled: true,
          fillColor:  isDark ? ColorsManger.whiteColor : ColorsManger.blackColor,
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide:
                     BorderSide(color: ColorsManger.gray300, width: 1.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide:  BorderSide(
                    color:ColorsManger.gray500, width: 1.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.3)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.3)),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: hintStyle ?? AppTestStyles.font16Regular(context).copyWith(
              color: 
                   ColorsManger.gray500
            
          )),
      style: AppTestStyles.font16Regular(context),
    );
  }
}