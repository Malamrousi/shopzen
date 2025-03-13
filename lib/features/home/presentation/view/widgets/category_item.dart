import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/test_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: ColorsManger.gray50,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
              child: CachedNetworkImage(
            width: 50.w,
            imageUrl:
                "https://cdn.pixabay.com/photo/2021/10/11/23/49/app-6702045_1280.png",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,
          )),
        ),
        verticalSpacing(8.h),
        Text(title, style: AppTestStyles.font16RegularThemeColor(context)),
      ],
    );
  }
}
