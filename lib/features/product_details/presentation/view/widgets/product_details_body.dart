import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/features/product_details/data/models/product_details_model.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/test_styles.dart';
import '../../../../../core/widgets/custom_favorite_icon.dart';
import '../../../../../core/widgets/custom_share_icon.dart';
import 'product_details_image_slider.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productDetailsModel});

  final ProductDetailsModel productDetailsModel;

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
            ProductDetailsImageSlider(
              imageList: productDetailsModel.images,
            ),
            verticalSpacing(20.h),
            Text(productDetailsModel.title ?? '',
                style: AppTestStyles.font20Bold(context)),
            verticalSpacing(10.h),
            Text(productDetailsModel.description ?? '',
                style: AppTestStyles.font14Regular(context)),
          ],
        ),
      ),
    );
  }
}
