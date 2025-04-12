import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/helper/string_extension.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/features/auth/data/models/user_role_model.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key, required this.userRoleModel});
  
  final UserRoleModel userRoleModel;

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
            imageUrl: userRoleModel.userImage ?? '',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,
          ),
        ),
        verticalSpacing(16.h),
        Text(
          "Mohammed Mostafa".toLowerCase().toCapitalized(),
          style: AppTestStyles.font20Bold(context),
        ),
        verticalSpacing(8.h),
        Text(
          "m.alamrousi.work2@gmail.com".toLowerCase().toCapitalized(),
          style: AppTestStyles.font16RegularWhiteColor(context),
        ),
      ],
    );
  }
}
