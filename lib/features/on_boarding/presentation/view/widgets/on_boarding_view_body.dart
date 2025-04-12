import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/assets/assets.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/core/widgets/custom_button.dart';
import 'package:shopzen/features/on_boarding/presentation/view/widgets/dark_and_lang_buttons.dart';


class OnBoardingViewBody extends StatelessWidget {
 const OnBoardingViewBody({super.key});

 @override
 Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        
         Expanded(
           child: Column(
           
             children: [
              DarkAndLangButtons(),
                verticalSpacing(30
                ),
               Image.asset(Assets.imagesOnBoarding),
               verticalSpacing(48),
               Text(
                 "welcome_to_shop_zen".tr(context),
                 textAlign: TextAlign.center,
                 style: AppTestStyles.font30Bold(context),
               ),
               verticalSpacing(8),
               Text(
                 "you_are_one_stop_destination_for_hassle_free_online_shopping".tr(context),
                 textAlign: TextAlign.center,
                 style: AppTestStyles.font18Bold(context),
               ),
               verticalSpacing(20),
               CustomButton(
                 onPressed: () {
                  context.pushNamed(RouteName.login);
                 },
                 title: "get_started".tr(context),
                 textStyle: AppTestStyles.font20BoldWhiteColor( context),
               )
             ],
           ),
         ),
       ],
     ),
   );
 }
}
