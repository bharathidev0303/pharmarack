
import 'package:pharmarack/packages/core_flutter/error/app_error.dart';
import 'package:pharmarack/packages/core_flutter/error/error_info.dart';
import 'package:pharmarack/packages/core_flutter/mapper/base_layer_data_transformer.dart';

abstract class BaseError extends BaseLayerDataTransformer<BaseError, AppError>
    implements Exception {
  final ErrorInfo error;
  final Exception cause;

  BaseError({required this.error, required this.cause});

  String getFriendlyMessage();

  logError() {}
}
