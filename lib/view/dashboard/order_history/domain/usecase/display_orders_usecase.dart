
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_param.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/repository/order_history_repository.dart';


class DisplayOrdersUseCase extends BaseUseCase<BaseError,
    DisplayOrderListParams, List<DisplayOrder>?> {
  final OrderHistoryRepository _repository;

  DisplayOrdersUseCase(this._repository);

  @override
  Future<Either<BaseError, List<DisplayOrder>?>> execute(
      {required DisplayOrderListParams params}) {
    return _repository.getDisplayOrders(params);
  }
}

class DisplayOrderListParams extends Params {
  final DisplayOrdersParam displayOrdersParam;

  DisplayOrderListParams(this.displayOrdersParam);
}
