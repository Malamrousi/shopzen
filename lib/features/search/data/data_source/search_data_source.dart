// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shopzen/core/api/api_services.dart';

import '../../../../core/api/Graphql/graphql_queries/search_queries.dart';
import '../../../home/data/model/get_all_product.dart';
import '../model/search_request_body.dart';

class SearchDataSource {
  final ApiService apiService;
  SearchDataSource({
    required this.apiService,
  });

  Future<GetAllProductResponse> searchProduct(SearchRequestBody body) async {
    return apiService.searchProduct(SearchQueries().searchProduct(body: body));
  }
}
