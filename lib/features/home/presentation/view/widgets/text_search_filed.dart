import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/widgets/app_text_form_filed.dart';

class TextSearchFiled extends StatelessWidget {
  const TextSearchFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormFiled(
      validator: (value) {},
      controller: TextEditingController(),
      hintText:"find_your_favorite_items".tr(context) ,
      prefixIcon: Icon(
        Icons.search_outlined,
        color: context.colorThemeExtension.textColor,
        size: 26.sp,
      ),
      
    );
  }
}
