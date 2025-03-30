import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/features/home/data/model/get_all_product.dart';

import '../../../../../core/routes/route_name.dart';
import '../../../../../core/widgets/custom_container_linear.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.product,
    required this.productId,
  });

  final GetAllProductModel product;
  final int? productId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.productDetails, arguments: productId);
      },
      child: CustomContainerLinear(
        height: 200.h,
        width: 165.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Share Button
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.share,
                    color: context.colorThemeExtension.textColor,
                  ),
                ),
                //Favorite Button
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.favorite_outline,
                    color: context.colorThemeExtension.textColor,
                  ),
                ),
              ],
            ),
            // Show Image
            Flexible(
              child: Center(
                child: CachedNetworkImage(
                  width: 120.w,
                  height: 120.h,
                  imageUrl: product.images?.first ??
                      "https://cdn.pixabay.com/photo/2022/05/27/10/35/strawberry-7224875_1280.jpg",
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 70,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                product.title ?? "no_name".tr(context),
                style: AppTestStyles.font18BoldPrimary400(context),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Category Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                product.category?.name ?? "no_name".tr(context),
                style: AppTestStyles.font14Regular(context),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                '\$ ${product.price}',
                style: AppTestStyles.font18Bold(context),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
