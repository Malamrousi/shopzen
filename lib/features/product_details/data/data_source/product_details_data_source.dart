import 'package:shopzen/features/product_details/data/models/product_details_model.dart';

import '../../../../core/api/Graphql/graphql_queries/product_details_queries.dart';
import '../../../../core/api/api_services.dart';

class ProductDetailsDataSource {
  final ApiService apiService;
  const ProductDetailsDataSource({
    required this.apiService,
  });

  Future<ProductDetailsResponse> getProductDetails(int id) async {
    final response = await apiService.getProductDetails(
        ProductDetailsQueries().getProductDetailsMapQuery(id: id));
    return response;
  }
}
