part of 'get_all_products_bloc.dart';

@freezed
class GetAllProductsState with _$GetAllProductsState {
  const factory GetAllProductsState.loading() = Loading;
  const factory GetAllProductsState.empty() = Empty;
  const factory GetAllProductsState.failure({required String message}) = Failure;
  const factory GetAllProductsState.success({
    required List<GetAllProductModel> products,
  }) = Success;}
