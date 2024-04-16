
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_detail_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/repository/order_history_repository.dart';

class OrderHistoryDetailUseCase extends BaseUseCase<BaseError,
    OrderHistoryDetailParams, DisplayOrderDetailModel> {
  final OrderHistoryRepository _repository;

  OrderHistoryDetailUseCase(this._repository);

  @override
  Future<Either<BaseError, DisplayOrderDetailModel>> execute(
      {required OrderHistoryDetailParams params}) {
    return _repository
        .getOrderHistoryDetail(params.orderHistoryDetailParam.orderId);
  }
}

class OrderHistoryDetailParams extends Params {
  final OrderHistoryDetailParam orderHistoryDetailParam;

  OrderHistoryDetailParams(this.orderHistoryDetailParam);
}

class OrderHistoryDetailParam {
  final double orderId;

  OrderHistoryDetailParam(this.orderId);
}
