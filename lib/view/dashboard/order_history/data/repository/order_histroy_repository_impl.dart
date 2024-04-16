
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/dashboard/order_history/data/data_source/order_history_remote_datasoruce.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/all_filter_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_detail_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/reorder_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/repository/order_history_repository.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/display_orders_usecase.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/reorder_use_case.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final OrderHistoryRemoteDataSource _remoteDataSource;

  OrderHistoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<NetworkError, List<DisplayOrder>?>> getDisplayOrders(
      DisplayOrderListParams param) {
    return _remoteDataSource.getDisplayOrderList(param);
  }

  @override
  Future<Either<BaseError, DisplayOrderDetailModel>> getOrderHistoryDetail(
      double orderId) {
    return _remoteDataSource.getOrderHistoryDetail(orderId);
  }

  @override
  Future<Either<BaseError, ReorderModel>> reorder(
      List<ReorderParam> reorderParams) {
    return _remoteDataSource.reorder(reorderParams);
  }

  @override
  Future<Either<BaseError, AllFilterModel>> allFilter() {
    return _remoteDataSource.allFilter();
  }
}
