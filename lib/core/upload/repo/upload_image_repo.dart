import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/services/Graphql/api_result.dart';
import 'package:shopzen/core/upload/data_source/upload_image_data_source.dart';
import 'package:shopzen/core/upload/model/upload_image_response.dart';

class UploadImageRepo {
  final UploadImageDataSource uploadImageDataSource;

  UploadImageRepo({required this.uploadImageDataSource});

  Future<ApiResult<UploadImageResponse>> uploadImage(
      {required XFile file}) async {
    try {
      final response = await uploadImageDataSource.uploadImage(file: file);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure("please_try_again_we_have_error".tr(
          getIt.get<GlobalKey<NavigatorState>>().currentState!.context, ));
    }
  }
}
