import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/features/home/presentation/view/widgets/banners_slider.dart';
import 'package:shopzen/features/home/presentation/view/widgets/text_search_filed.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomScrollView(
        slivers: [
           SliverToBoxAdapter(
            child: verticalSpacing(40.h),
          ),
          SliverToBoxAdapter(
            child: TextSearchFiled(),
          ),
             SliverToBoxAdapter(
            child: verticalSpacing(20.h),
          ),
             SliverToBoxAdapter(
            child: BannersSlider(),
          ),
        ],
      ),
    );
  }
}
