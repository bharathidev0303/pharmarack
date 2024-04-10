
import 'package:dio/dio.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';

NetworkError getError({required Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      return NetworkError(
          httpError: apiResponse.statusCode!,
          cause: Exception("Server Response Error"),
          message: apiResponse.statusMessage!);
    } catch (exception) {
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
