import '../../../../core/api/api_result.dart';
import '../data_source/category_data_source.dart';
import '../model/get_all_categories.dart';

class CategoryRepo {
  final CategoryDataSource categoryDataSource;

  CategoryRepo({required this.categoryDataSource});

  Future<ApiResult<GetAllCategoriesResponse>> getAllCategories() async {
    try {
      final response = await categoryDataSource.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
