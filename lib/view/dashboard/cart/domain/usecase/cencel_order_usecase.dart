
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';

import '../repository/cart_repository.dart';

class CancelOrderUseCase
    extends BaseUseCase<BaseError, CancelOrderParams, String> {
  final CartRepository _cartRepository;

  CancelOrderUseCase(this._cartRepository);

  @override
  Future<Either<BaseError, String>> execute(
      {required CancelOrderParams params}) {
    final payLoad = {'tempOrderId': params.tempOrderId};
    return _cartRepository.cancelOrder(payLoad);
  }
}

class CancelOrderParams extends Params {
  String tempOrderId;

  CancelOrderParams({required this.tempOrderId});
}
