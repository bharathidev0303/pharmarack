import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core/network/base_api_response/base_api_response.dart';
import 'package:retrofit/dio.dart';

abstract class Base {}

class Left extends Base {}

class Right extends Base {}

abstract class BaseRemoteDataSource {
  final int successCode = 200;
  final int defaultFailureCode = 0;

  Future<Either<Failure, HttpResponse<String?>>> baseResponseParser(
      Future<HttpResponse<String>> request) async {
    HttpResponse? apiResponse;
    try {
      apiResponse = await request;
      if (apiResponse.response.statusCode == successCode) {
        return right(HttpResponse(apiResponse.data, apiResponse.response));
      } else {
        return left(Failure(apiResponse.response.statusMessage ?? "",
            apiResponse.response.statusCode ?? defaultFailureCode));
      }
    } on DioException catch (e) {
      return left(Failure(e.message ?? e.response?.statusMessage ?? "",
          e.response?.statusCode ?? defaultFailureCode));
    } catch (e) {
      return left(Failure(e.toString(), defaultFailureCode));
    }
  }
}
