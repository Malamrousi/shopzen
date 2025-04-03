import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/test_styles.dart';
import '../../../../../core/widgets/custom_favorite_icon.dart';
import '../../../../../core/widgets/custom_share_icon.dart';
import 'product_details_image_slider.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShareIcon(),
                CustomFavoriteIcon(),
              ],
            ),
            verticalSpacing(10.h),
            ProductDetailsImageSlider(),
            verticalSpacing(20.h),
            Text("Modern Minimalist Workstation Setup",
                style: AppTestStyles.font20Bold(context)),
            verticalSpacing(10.h),
            Text(
                "Elevate your home office with our Modern Minimalist Workstation Setup, featuring a sleek wooden desk topped with an elegahhnt computer, stylish adjustable wooden desk lamp, and complimentary accessories for a clean, productive workspace. This setup is perfect for professionals seeking a contemporary look that combines functionality with design.",
                style: AppTestStyles.font14Regular(context)),
          ],
        ),
      ),
    );
  }
}
