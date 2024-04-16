
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/all_filter_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_detail_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/reorder_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/display_orders_usecase.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/reorder_use_case.dart';

abstract class OrderHistoryRepository {
  Future<Either<NetworkError, List<DisplayOrder>?>> getDisplayOrders(
      DisplayOrderListParams param);

  Future<Either<BaseError, DisplayOrderDetailModel>> getOrderHistoryDetail(
      double orderId);

  Future<Either<BaseError, ReorderModel>> reorder(
      List<ReorderParam> reorderParams);

  Future<Either<BaseError, AllFilterModel>> allFilter();
}
