import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/features/home/presentation/view/widgets/banners_slider.dart';
import 'package:shopzen/features/home/presentation/view/widgets/categories_text.dart';
import 'package:shopzen/features/home/presentation/view/widgets/product_text.dart';

import 'categories_list.dart';
import 'products_grid_list.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: verticalSpacing(30.h),
          ),
         
    
          SliverToBoxAdapter(
            child: CategoriesText(),
          ),
          SliverToBoxAdapter(
            child: verticalSpacing(5.h),
          ),
          SliverToBoxAdapter(
            child: CategoriesList(),
          ),
          SliverToBoxAdapter(
            child: verticalSpacing(10.h),
          ),
          SliverToBoxAdapter(
            child: BannersSlider(),
          ),
            SliverToBoxAdapter(
            child: verticalSpacing(10.h),
          ),
            SliverToBoxAdapter(
            child: ProductText(),
          ),
            SliverToBoxAdapter(
            child: verticalSpacing(5.h),
          ),
            SliverToBoxAdapter(
            child: ProductsGridList(),
          ),
        ],
      ),
    );
  }
}
