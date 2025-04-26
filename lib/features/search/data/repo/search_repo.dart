import 'package:shopzen/core/api/api_result.dart';
import 'package:shopzen/features/search/data/data_source/search_data_source.dart';

import '../../../home/data/model/get_all_product.dart';
import '../model/search_request_body.dart';

class SearchRepo {
  final SearchDataSource searchDataSource;

  SearchRepo({required this.searchDataSource});

  Future<ApiResult<GetAllProductResponse>> searchProduct(
      SearchRequestBody body) async {
        try {
          final response = await searchDataSource.searchProduct(body);
          return ApiResult.success(response);
        } catch (e) {
          return ApiResult.failure(e.toString());
        }
      }
}
