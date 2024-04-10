

import 'package:pharmarack/packages/core_flutter/constants/error_types.dart';
import 'package:pharmarack/packages/core_flutter/error/app_error.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/error_info.dart';

class LocalError extends BaseError {
  LocalError({
    required String message,
    required int localError,
    required super.cause,
  }) : super(error: ErrorInfo(message: message, code: localError));

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 1:
        return AppError(error: error, cause: cause, type: ErrorType.ui);
      case 2:
        return AppError(
            error: error, cause: cause, type: ErrorType.filterError);
      default:
        return AppError(
            error: error, cause: cause, type: ErrorType.ioexception);
    }
  }
}
