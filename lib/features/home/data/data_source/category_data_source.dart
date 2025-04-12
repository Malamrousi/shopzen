import '../../../../core/api/Graphql/graphql_queries/categories_queries.dart';
import '../../../../core/api/api_services.dart';
import '../model/get_all_categories.dart';

class CategoryDataSource {
  final ApiService apiService;

  CategoryDataSource({required this.apiService});

  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response =
        await apiService.getAllCategories(CategoryQueries().getAllCategories());
    return response;
  }
}
