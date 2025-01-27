import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopzen/core/api/api_services.dart';
import 'package:shopzen/core/upload/model/upload_image_response.dart';

class UploadImageDataSource {
  final ApiService apiServices;
  UploadImageDataSource({required this.apiServices});

  Future<UploadImageResponse> uploadImage({required XFile file}) async {
    final fromData = await FormData();

    fromData.files
        .add(MapEntry('file', await MultipartFile.fromFile(file.path)));

    final response = await apiServices.uploadImage(fromData);
    return response;
  }
}
