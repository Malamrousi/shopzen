import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';

import '../../../../../core/cubit/app_cubit/app_cubit.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/test_styles.dart';

class ThemeChange extends StatelessWidget {
  const ThemeChange({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<AppCubit>();

    return Row(
      children: [
        Icon(
          Icons.dark_mode_outlined,
          color: context.colorThemeExtension.textColor,
          size: 26.sp,
        ),
        horizontalSpacing(8.w),
        Text(
          "dark_mode".tr(context),
          style: AppTestStyles.font18Regular(context),
        ),
        Spacer(),
        Transform.scale(
          scale: 0.75,
          child: Switch.adaptive(
            value: themeCubit.isDark,
            onChanged: (value) {
              themeCubit.changeAppThemeMode();
            },
            inactiveTrackColor: const Color(0xff262626),
            activeColor: ColorsManger.alertColorGreen500,
          ),
        )
      ],
    );
  }
}
