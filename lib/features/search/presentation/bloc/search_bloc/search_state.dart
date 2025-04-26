part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
    const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = Loading;
  const factory SearchState.failure({required String message}) = Failure;
  const factory SearchState.success(
    {
          required List<GetAllProductModel> products,

    }
  ) = Success;
  const factory SearchState.empty() = Empty;
}
