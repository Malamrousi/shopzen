import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/assets/assets.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/helper/string_extension.dart';
import 'package:shopzen/features/home/presentation/view/widgets/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryItem(
            image: Assets.svgBell,
            title: "رياضه".toLowerCase().toCapitalized(),
          );
        },
        separatorBuilder: (context, index) {
          return horizontalSpacing(20.w);
        },
      ),
    );
  }
}
