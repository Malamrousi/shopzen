import 'package:shopzen/core/api/api_result.dart';

import '../data_source/product_details_data_source.dart';
import '../models/product_details_model.dart';

class ProductDetailsRepo {
  final ProductDetailsDataSource productDetailsDataSource;

  ProductDetailsRepo({required this.productDetailsDataSource});

  Future<ApiResult<ProductDetailsResponse>> getProductDetails(int id) async {
    try {
      final response = await productDetailsDataSource.getProductDetails(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}