

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://student.valuxapps.com/api/',
    ));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    
  }) async {
    dio!.options.headers = {
      'Authorization': token??'',
      'Content-Type':'application/json',
      'lang': 'en',
    };
    try {
      return await dio!.post(url, data: data, queryParameters: query);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
        if (e.type == DioExceptionType.connectionTimeout) {
          print('Error receiving response! Connection timeout!');
        } else if (e.type == DioExceptionType.sendTimeout) {
        } else if (e.type == DioException.receiveTimeout) {
          print('Error receiving response! Timeout!');
        } else if (e.type == DioExceptionType.unknown) {
          print('Error receiving response! Something went wrong!');
        }
      }

      rethrow;
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token??'',
      'Content-Type':'application/json',
      'lang': 'en',
    };
    try {
      return await dio!.get(
        url,
        data: data,
        queryParameters: query,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
        if (e.type == DioExceptionType.connectionTimeout) {
          print('Error receiving response! Connection timeout!');
        } else if (e.type == DioExceptionType.sendTimeout) {
        } else if (e.type == DioException.receiveTimeout) {
          print('Error receiving response! Timeout!');
        } else if (e.type == DioExceptionType.unknown) {
          print('Error receiving response! Something went wrong!');
        }
      }

      rethrow;
    }
  }
}
