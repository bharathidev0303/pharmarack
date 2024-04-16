
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/dashboard/order_history/data/api_service/order_history_api_service.dart';
import 'package:pharmarack/view/dashboard/order_history/data/api_service/order_history_api_service_legacy.dart';
import 'package:pharmarack/view/dashboard/order_history/data/endpoint_constants/order_history_endpoint_constants.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/all_filter_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_detail_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/reorder_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/display_orders_usecase.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/reorder_use_case.dart';
// import 'package:retailer/features/order_history/data/model/all_filter.dart';

class OrderHistoryRemoteDataSource {
  final OrderHistoryApiServiceLegacy _orderHistoryApiServiceLegacy;
  final OrderHistoryApiService _orderHistoryApiService;

  OrderHistoryRemoteDataSource(
    this._orderHistoryApiServiceLegacy,
    this._orderHistoryApiService,
  );

  Future<Either<NetworkError, List<DisplayOrder>>> getDisplayOrderList(
      DisplayOrderListParams param) async {
    final response = await safeApiCall(
      _orderHistoryApiService.getDisplayOrders(
        param.displayOrdersParam.userId,
        param.displayOrdersParam.storeId,
        param.displayOrdersParam.searchText,
        param.displayOrdersParam.fromDate,
        param.displayOrdersParam.toDate,
        param.displayOrdersParam.status,
        param.displayOrdersParam.operation,
      ),
    );
    return response.fold((l) => left(l), (r) {
      return right(
        r.data.orders
                ?.map((e) => DisplayOrder.fromDisplayOrderEntity(e))
                .toList() ??
            [],
      );
    });
  }

  Future<Either<BaseError, DisplayOrderDetailModel>> getOrderHistoryDetail(
      double orderId) async {
    final response = await safeApiCall(
      _orderHistoryApiService.getOrderHistoryDetail(
        orderId.toInt(),
      ),
    );

    return response.fold((l) => left(l), (r) {
      return right(DisplayOrderDetailModel.fromDisplayOrderDetail(r.data));
    });
  }

  Future<Either<BaseError, ReorderModel>> reorder(
      List<ReorderParam> reorderParams) async {
    final response = await safeApiCall(
      _orderHistoryApiService.reorder(
          OrderHistoryEndPointConstants.retailerReorder, reorderParams),
    );

    return response.fold((l) => left(l), (r) {
      return Either.right(ReorderModel.fromReorderEntity(r.data));
    });
  }

  Future<Either<BaseError, AllFilterModel>> allFilter() async {
    final response = await safeApiCall(_orderHistoryApiService.getAllFilter());
    return response.fold((l) => left(l),
        (r) => Either.right(AllFilterModel.fromAllFilter(r.data)));
  }
}
