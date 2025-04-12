import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';

import '../../../../../core/animations/animate_do.dart';
import '../../../../../core/utils/nav_bar_enum.dart';
import '../../bloc/main_cubit/main_cubit_cubit.dart';

import 'notification_bar_icon.dart';  
class CustomMainScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomMainScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.colorThemeExtension.mainColor,
      elevation: 0,
      title: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
         if(cubit.navBarEnum == NavBarEnum.home) {
            return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFadeInRight(
                duration: 800,
                child: Column(
                  children: [
                    Text(
                      "hello".tr(context),
                      style: AppTestStyles.font20Bold(context),
                    ),
                    Text(
                      "Mohammed",
                      style: AppTestStyles.font18Regular(context),
                    ),
                  ],
                ),
              ),
              CustomFadeInLeft(
                duration: 800,
                child: Center(
                  child: NotificationBarIcon(),
                ),
              )
            ],
          );
         }else{
          return SizedBox.shrink();
         }
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
