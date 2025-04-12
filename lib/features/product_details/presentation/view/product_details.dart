import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/string_extension.dart';
import 'package:shopzen/core/widgets/custom_app_bar.dart';
import 'package:shopzen/features/product_details/presentation/view/widgets/add_to_cart_button.dart';
import 'package:shopzen/features/product_details/presentation/view/widgets/product_details_body.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/styles/test_styles.dart';
import '../bloc/product_details/product_details_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ProductDetailsBloc>()
        ..add(
          ProductDetailsEvent.getProductDetails(id: productId),
        ),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
              loading: () => const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ),
              failure: (failure) => Scaffold(
                    body: Center(
                        child: Text(
                      "error".tr(context),
                      style: AppTestStyles.font20Bold(context),
                    )),
                  ),
              success: (product) {
                return Scaffold(
                  appBar:
                      CustomAppBar(title: product.title?.convertLongString() ??""),
                  bottomNavigationBar: AddToCartButton(
                    price: product.price.toString(),
                  ),
                  body: SafeArea(child: ProductDetailsBody(
                    productDetailsModel: product,
                  )),
                );
              });
        },
      ),
    );
  }
}
