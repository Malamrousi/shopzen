// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/api/api_result.dart';
import '../data_source/product_data_source.dart';
import '../model/get_all_product.dart';

class ProductRepo {
 final ProductDataSource dataSource;
  ProductRepo({
    required this.dataSource,
  });
    Future<ApiResult<GetAllProductResponse>> getAllProducts() async {
    try {
      final response = await dataSource.getAllProducts();
      return ApiResult.success(response);
    } catch (e) {
      return  ApiResult.failure(e.toString());
    }
  }
}
