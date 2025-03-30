import 'package:flutter/material.dart';
import 'package:shopzen/core/widgets/custom_app_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product Details"),
    );
  }
}
