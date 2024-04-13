import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/cart/data/model/place_order_api_request.dart';
import 'package:pharmarack/view/features/cart/domain/repository/cart_repository.dart';

class PlaceOrderUseCase
    extends BaseUseCase<BaseError, PlaceOrderParam, String?> {
  final CartRepository _cartRepository;

  PlaceOrderUseCase(this._cartRepository);

  @override
  Future<Either<BaseError, String?>> execute(
      {required PlaceOrderParam params}) {
    // TODO: implement execute
    return _cartRepository.placeOrder(params.list);
  }
}

class PlaceOrderParam extends Params {
  final List<PlaceOrderApiRequest> list;

  PlaceOrderParam({
    required this.list,
  });
}
