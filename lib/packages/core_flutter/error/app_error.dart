

import 'package:pharmarack/packages/core_flutter/constants/error_types.dart';
import 'package:pharmarack/packages/core_flutter/error/error_info.dart';

class AppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception cause;

  AppError({
    Exception? cause,
    required this.error,
    ErrorType? type,
  })  : cause = cause ?? Exception(),
        type = type ?? ErrorType.textFieldValidation;
}
