import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';

import '../../../../../core/widgets/custom_container_linear.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.categoryName,
      required this.price});
  final String imageUrl;
  final String title;
  final String categoryName;
  final double price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                
                  fit: BoxFit.fill,
                  imageUrl: imageUrl,

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
               title,
              style: AppTestStyles.font18BoldPrimary400(context),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Category Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                  categoryName,
              style: AppTestStyles.font14Regular(context),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                '\$ $price',
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
