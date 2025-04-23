import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/features/home/presentation/view/widgets/banners_slider.dart';
import 'package:shopzen/features/home/presentation/view/widgets/categories_text.dart';
import 'package:shopzen/features/home/presentation/view/widgets/text_search_filed.dart';

import 'categories_list.dart';
import 'products_grid_list.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                                verticalSpacing(30.h),

                TextSearchFiled(),
                verticalSpacing(10.h),
                CategoriesText(),
                verticalSpacing(5.h),
                CategoriesList(),
                verticalSpacing(10.h),
                BannersSlider(),
                verticalSpacing(10.h),
                verticalSpacing(5.h),
              ],
            ),
          ),
        ),
        const ProductsGridList(),
      ],
    );
  }
}