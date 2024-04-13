import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/store_status_request_model.dart';

/// This class [StockiestPriorityRepository] is the blueprint of network api call
abstract class StockiestPriorityRepository {
  Future<Either<BaseError, List<StockiestPriorityModel>>> getStockiestResponses(
      int userId);

  Future<Either<BaseError, List<StockiestPriorityModel>>>
      getOrderDistributorResponses();

  Future<Either<BaseError, List<DistributorStoreModel>>>
      getNonMappedDistributor(
          {required String userId, required String retailerId});

  Future<Either<BaseError, bool>> saveDistributorPriorities(
      int userId, String stockiestPriorityText, String record, String fieldSep);

  Future<Either<BaseError, List<StoreStatusRequestModel>>>
      sendStoreRequestMapping(Map<String, dynamic> map);
}
