import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/features/profile/data/repo/user_info_repo.dart';

import '../../../../../core/secure_storage/secure_storage_keys.dart';
import '../../../../../core/secure_storage/secure_storage_service.dart';
import '../../../../auth/data/models/user_role_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.userInfoRepo})
      : super(const ProfileState.loading()) {
    on<GetUserInfoEvent>(getUserInfo);
  }
  final UserInfoRepo userInfoRepo;
  FutureOr<void> getUserInfo(
      GetUserInfoEvent event, Emitter<ProfileState> emit) async {
        final token = await SecureStorageService().readSecureData(SecureStorageKeys.accessToken);
    emit(const ProfileState.loading());
    final result = await userInfoRepo.getUserProfileInfo(
      token:token ?? "",
    );
    result.when(success: (userInfo) {
      emit(ProfileState.success(userRoleModel: userInfo));
    }, failure: (failure) {
      emit(ProfileState.failure(message: failure.toString()));
    });
  }
}
