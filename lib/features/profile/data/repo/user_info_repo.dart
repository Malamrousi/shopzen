import 'package:shopzen/features/auth/data/models/user_role_model.dart';
import 'package:shopzen/features/profile/data/data_source/profile_data_source.dart';

import '../../../../core/api/api_result.dart';

class UserInfoRepo {
  final ProfileDataSource profileDataSource;

  UserInfoRepo({required this.profileDataSource});

  Future<ApiResult<UserRoleModel>> getUserProfileInfo(
      {required String token}) async {
    try {
      final response = await profileDataSource.getUserInfo(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
