import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/animations/animate_do.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/assets/assets.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

import '../../../../../core/utils/nav_bar_enum.dart';
import '../../bloc/main_cubit/main_cubit_cubit.dart';
import 'icon_tap_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: SizedBox(
        height: 103.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 15.h),
            Container(
              height: 88.h,
              color: context.colorThemeExtension.bottomNavColor,
              child: SizedBox(
                height: 45.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: BlocBuilder<MainCubit, MainState>(
                    builder: (context, state) {
                      final cubit = context.read<MainCubit>();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Home Screen
                          IconTapNavBar(
                            image: Assets.svgHomeBottomNavBar,
                            isSelected: cubit.navBarEnum == NavBarEnum.home,
                            onTap: () {
                              cubit.selectedNavBarIcons(NavBarEnum.home);
                            },
                            title: "home".tr(context),
                          ),
                        
                          IconTapNavBar(
                            image: Assets.svgFavoritesBottomNavBar,
                            isSelected:
                                cubit.navBarEnum == NavBarEnum.favorites,
                            onTap: () {
                              cubit.selectedNavBarIcons(
                                NavBarEnum.favorites,
                              );
                            },
                            title: "favorites".tr(context),
                          ),
                          IconTapNavBar(
                            image: Assets.svgCartBottomNavBar,
                            isSelected: cubit.navBarEnum == NavBarEnum.cart,
                            onTap: () {
                              cubit.selectedNavBarIcons(
                                NavBarEnum.cart,
                              );
                            },
                            title: "cart".tr(context),
                          ),
                          IconTapNavBar(
                            image: Assets.svgAccountBottomNavBar,
                            isSelected: cubit.navBarEnum == NavBarEnum.profile,
                            onTap: () {
                              cubit.selectedNavBarIcons(
                                NavBarEnum.profile,
                              );
                            },
                            title: "account".tr(context),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
