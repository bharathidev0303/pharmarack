import 'package:pharmarack/packages/core_flutter/constants/error_types.dart';
import 'package:pharmarack/packages/core_flutter/error/app_error.dart';
import 'package:pharmarack/packages/core_flutter/error/error_info.dart';

import 'base_error.dart';

class NetworkError extends BaseError {
  NetworkError({
    required dynamic httpError,
    String message = "",
    required super.cause,
  }) : super(error: ErrorInfo(code: httpError, message: message));

  get httpError => null;

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      default:
        return AppError(
          cause: cause,
          error: error,
          type: ErrorType.unknown,
        );
    }
  }
}
