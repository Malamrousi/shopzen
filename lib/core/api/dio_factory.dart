import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:shopzen/core/utils/app_logout.dart';

import '../secure_storage/secure_storage_keys.dart';
import '../secure_storage/secure_storage_service.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers['Authorization'] =
            'Bearer ${SecureStorageService().readSecureData(SecureStorageKeys.accessToken)}';

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        request: false,
        compact: false,
      ),
    );

    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${SecureStorageService().readSecureData(SecureStorageKeys.accessToken)}';

          return handler.next(options);
        },
        onError: (error, header) async {
          if (error.response?.statusCode == 400) {
            await AppLogout().logout();
          }else if(error.response?.statusCode == 401){
            
          }
        },
      ),
    );
  }
}
