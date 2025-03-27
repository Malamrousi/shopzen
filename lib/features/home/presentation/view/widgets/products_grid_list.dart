import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/features/home/presentation/view/widgets/product_item.dart';

class ProductsGridList extends StatelessWidget {
  const ProductsGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 165 / 200,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductItem(
            imageUrl: "https://th.bing.com/th/id/OIP.KD5TiA6k_Ug8SWjYmxQ4ZgHaIr?rs=1&pid=ImgDetMain",
            title: "فروله",
            categoryName: "فواكه",
            price: 1000,
          );
        });
  }
}
