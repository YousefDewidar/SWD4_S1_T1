import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> get({required String endPoint}) async {
    try {
      final response = await _dio.get("https://dummyjson.com$endPoint");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
