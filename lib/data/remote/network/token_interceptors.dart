import 'package:dio/dio.dart';
import 'package:x_app/data/local/data_sources/user_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SecureStorage.read();
    if (token != null ||token!='') {
      options.headers['Authorization'] =
          'Bearer $token';
    }
    return handler.next(options);
  }
}
