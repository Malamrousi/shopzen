part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = LoadingState;
  const factory LoginState.failure({required String failureMessage}) = FailureState;
  const factory LoginState.success({required String userRole}) =SuccessState;
}
