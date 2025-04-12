part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success({
    required UserRoleModel userRoleModel,
  }) = Success;
  const factory ProfileState.failure({required String message}) = Failure;
}
