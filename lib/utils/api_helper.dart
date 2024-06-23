import 'package:dio/dio.dart';

class ApiHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://527d-197-165-157-42.ngrok-free.app/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String? url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
    return await dio.get(url!, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
    return await dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String? url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
    return await dio.put(url!, queryParameters: query);
  }
}