part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = LoadingState;
  const factory AuthState.failure({required String failureMessage}) = FailureState;
  const factory AuthState.success({required String userRole}) =SuccessState;
}
