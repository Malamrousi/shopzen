import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/animations/animate_do.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/cubit/app_cubit/app_cubit.dart';
import 'package:shopzen/features/on_boarding/presentation/view/widgets/custom_linear_button.dart';

import '../../../../../core/utils/styles/test_styles.dart';
class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 800,
              child: CustomLinearButton(
                onPressed: cubit.changeAppThemeMode,
                child: Icon(
                  cubit.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
              if (cubit.currentLangCode == ENGLISH) {
                cubit.toArabic();
              } else {
                cubit.toEnglish();
              }
            },
            height: 44.h,
            width: 100.w,
            child: Text(
              cubit.currentLangCode == ENGLISH
                  ? "arabic".tr(context)
                  : "english".tr(context),
              style: AppTestStyles.font16Regular(context),
            ),
          ),
        ),
      ],
    );
  }
}