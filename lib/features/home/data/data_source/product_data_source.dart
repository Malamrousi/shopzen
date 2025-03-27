  import '../../../../core/api/Graphql/graphql_queries/products_queries.dart';
import '../../../../core/api/api_services.dart';
import '../model/get_all_product.dart';

class HomeDataSource {
  const HomeDataSource(this.apiService);

  final ApiService apiService;





  Future<GetAllProductResponse> getAllProducts() async {
    final response = await apiService
        .getAllProduct(ProductsQueries().getAllProductsMapQuery());
    return response;
  }
}