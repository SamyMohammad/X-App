import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:x_app/app/constants.dart';
import 'package:x_app/data/remote/network/token_interceptors.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "Accept";
const String AUTHORIZATION = "Authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  // final KeyValueStorage keyValueStorage;
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      // AUTHORIZATION:'Bearer ${await UserSecureStorage.getUserToken()}',
      DEFAULT_LANGUAGE: 'en'
    };
    dio.options = BaseOptions(
        headers: headers,
        receiveTimeout:const Duration(milliseconds: Constants.apiTimeOut) ,
        sendTimeout: const Duration(milliseconds: Constants.apiTimeOut));
    dio.interceptors.add(AuthInterceptor());

    if (!kReleaseMode) {
      // its debug mode so print app logs

      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }

    return dio;
  }
}
