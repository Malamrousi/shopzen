import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/widgets/loading_shimmer.dart';

import '../../../../../core/helper/spacing.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                LoadingShimmer(
                  width: 60.w,
                  height: 70.h,
                  borderRadius: 8.r,
                ),
                verticalSpacing(8.h),
                LoadingShimmer(
                  height: 20.h,
                  width: 75.w,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return horizontalSpacing(20.w);
          },
          itemCount: 4),
    );
  }
}
