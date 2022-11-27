import 'dart:io';

import 'package:app_weather/config/build_config.dart';
import 'package:app_weather/service/interceptor/logger_interceptor.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class RemoteApiService{
  late Dio _dio;

  Dio get dio => _dio;

  bool check = true;

  RemoteApiService({bool check = true}){
    const timeout = Duration(seconds: 30);
    final options = BaseOptions(
      baseUrl:check ? BuildConfig.baseUrl : BuildConfig.baseUrl1,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: timeout.inMilliseconds,
      receiveTimeout: timeout.inMilliseconds,
    );
    _dio =Dio(options);
    _dio.interceptors.add(LoggerInterceptor());
  }
  handlerError(dynamic error) {
    developer.log('Error:\n$error \n==========\nStackTrace:\n${error.stackTrace}',name: 'HandlerError');
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return 'Kết nối mạng không ổn định, vui lòng thử lại';
        default:
          return error.error is SocketException
              ? 'Vui lòng kiểm tra kết nối mạng'
              : 'Đã có lỗi xảy ra, vui lòng thử lại';
      }
    } else {
      return 'Đã có lỗi xảy ra, vui lòng thử lại';
    }
  }
}