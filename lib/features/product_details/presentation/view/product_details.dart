import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/widgets/custom_app_bar.dart';
import 'package:shopzen/features/product_details/presentation/view/widgets/add_to_cart_button.dart';
import 'package:shopzen/features/product_details/presentation/view/widgets/product_details_body.dart';

import '../../../../core/di/di.dart';
import '../bloc/product_details/product_details_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ProductDetailsBloc>()..add(
        ProductDetailsEvent.getProductDetails(id: productId),
      ),
      child: Scaffold(
        appBar: CustomAppBar(title: "Product Details"),
        bottomNavigationBar: AddToCartButton(
          price: 30.18,
        ),
        body: SafeArea(child: ProductDetailsBody()),
      ),
    );
  }
}
