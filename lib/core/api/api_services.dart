import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopzen/core/upload/model/upload_image_response.dart';
import 'package:shopzen/features/auth/data/models/login_response_model.dart';
import 'package:shopzen/features/auth/data/models/user_role_model.dart';

part 'api_services.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponseModel> login(
    @Body() Map<String, dynamic> getUser,
  );

  @GET("/api/v1/auth/profile")
  Future<UserRoleModel> userRole();

  @POST("/api/v1/files/upload")
  Future<UploadImageResponse> uploadImage(
    @Body() FormData? file,
  );
}
