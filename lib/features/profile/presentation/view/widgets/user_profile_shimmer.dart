import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/widgets/loading_shimmer.dart';

import '../../../../../core/helper/spacing.dart';

class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingShimmer(
          height: 80.h,
          width: 80.w,
          borderRadius: 45.r,
        ),
        verticalSpacing(16.h),
        LoadingShimmer(height: 20.h, width: 150.w),
        verticalSpacing(8.h),
        LoadingShimmer(height: 20.h, width: 150.w),
      ],
    );
  }
}