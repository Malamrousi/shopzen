
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/features/home/presentation/view/widgets/products_shimmer.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utils/styles/test_styles.dart';
import '../../../../../core/widgets/custom_product_item.dart';
import '../../bloc/get_all_products/get_all_products_bloc.dart';

class ProductsGridList extends StatelessWidget {
  const ProductsGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<GetAllProductsBloc>()
        ..add(
          GetAllProductsEvent.getAllProduct(),
        ),
      child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
        builder: (context, state) {
          return state.when(
            loading: () => SliverToBoxAdapter(
              child: Center(child: ProductShimmer()),
            ),
            success: (products) => SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 165.w  / 250.h,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CustomProductItem(
                    product: products[index],
                    productId: int.parse(products[index].id ?? "0"),
                  ),
                  childCount: products.length,
                ),
              ),
            ),
            empty: () => SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "no_products".tr(context),
                  style: AppTestStyles.font20Bold(context),
                ),
              ),
            ),
            failure: (failure) => SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "please_try_again_we_have_error".tr(context),
                  style: AppTestStyles.font20Bold(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
