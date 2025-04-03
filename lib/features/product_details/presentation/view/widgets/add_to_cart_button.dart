import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/animations/animate_do.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/core/widgets/custom_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.price});

  final num price;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Container(
        height: 100.h,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: context.colorThemeExtension.containerLinear1,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: AppTestStyles.font20Bold(context),
              ),
              CustomButton(
                onPressed: () {},
                bottomHeight: 40.h,
                bottomWidth: 200.w,
                title: "add_to_cart".tr(context),
                textStyle: AppTestStyles.font16BoldWhiteColor(context),
                backgroundColor: ColorsManger.primaryColor400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
