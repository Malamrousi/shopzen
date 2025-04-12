part of 'get_all_categories_bloc.dart';

@freezed
class GetAllCategoriesState with _$GetAllCategoriesState {
  const factory GetAllCategoriesState.loading() = Loading;
  const factory GetAllCategoriesState.empty() = Empty;
  const factory GetAllCategoriesState.failure({required String message}) = Failure;
  const factory GetAllCategoriesState.success({
    required List<GetAllCategoriesModel> categories,
  }) = Success;
}
