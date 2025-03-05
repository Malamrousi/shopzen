import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/helper/string_extension.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(45.r),
          child: CachedNetworkImage(
            width: 80.w,
            height: 80.h,
            imageUrl: "https://cdn.pixabay.com/photo/2025/02/26/09/58/bird-9432600_1280.jpg",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,
          ),
        ),
        verticalSpacing(16.h),
        Text(
          "mohammed".toLowerCase().toCapitalized(),
          style:AppTestStyles.font20Bold(context) ,
        ),
              verticalSpacing(8.h),
         Text(
          "m.alamrousi.work@gmail.com".toLowerCase().toCapitalized(),
          style:AppTestStyles.font16Regular(context) ,
        ),
      ],
    );
  }
}
