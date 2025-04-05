import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/cubit/app_cubit/app_cubit.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/widgets/custom_dialogs.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/test_styles.dart';

class LangChange extends StatelessWidget {
  const LangChange({super.key});

  @override
  Widget build(BuildContext context) {
    final langCubit = context.read<AppCubit>();
    return BlocBuilder(
      bloc: langCubit,
      builder: (context, state) {
        return Row(
          children: [
            Icon(
              Icons.language,
              color: context.colorThemeExtension.textColor,
              size: 26.sp,
            ),
            horizontalSpacing(8.w),
            Text(
              "language".tr(context),
              style: AppTestStyles.font18Regular(context),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                CustomDialog.twoButtonDialog(
                    context: context,
                    textBody: "change_language".tr(context),
                    textButton1: "sure".tr(context),
                    textButton2: "cancel".tr(context),
                    onPressed: () {
                       selectLangButton(context: context, cubit: langCubit);
                    },
                    isLoading: false);
              },
              child: Row(
                children: [
                  Text(
                    "lang_key".tr(context),
                    style: AppTestStyles.font16RegularWhiteColor(context),
                  ),
                  horizontalSpacing(5.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.colorThemeExtension.textColor,
                    size: 22.sp,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void selectLangButton({
    required BuildContext context,
    required AppCubit cubit,
  }) {
    if (AppLocalizations.of(context)!.locale?.languageCode == "en") {
      cubit.toArabic();
    }else{
      cubit.toEnglish();
    }
    context.pop();
  }
}
