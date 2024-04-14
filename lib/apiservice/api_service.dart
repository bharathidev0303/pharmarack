import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get({required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.get('${_dio.options.baseUrl}$endPoint',
        data: data, queryParameters: params);
    return response;
  }

  Future<Response> post(
      {required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.post('${_dio.options.baseUrl}$endPoint',
        data: data, queryParameters: params);
    return response;
  }

  Future<Response> put(
      {required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.put('${_dio.options.baseUrl}$endPoint',
        data: data, queryParameters: params);
    return response;
  }

  Future<Response> delete(
      {required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.delete('${_dio.options.baseUrl}$endPoint',
        data: data, queryParameters: params);
    return response;
  }
}
