part of 'product_details_bloc.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.loading() = Loading;
  const factory ProductDetailsState.success({
    required ProductDetailsModel productDetailsModel,

  }) = Success;
  const factory ProductDetailsState.failure({required String message}) = Failure;
}
