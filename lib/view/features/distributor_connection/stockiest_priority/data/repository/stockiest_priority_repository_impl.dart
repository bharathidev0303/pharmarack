import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/data_source/remote_data_source/stockiest_priority_remote_data_source.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/store_status_request_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';

/// This class [StockiestPriorityRepositoryImpl] is the implementation of [StockiestPriorityRepository]
class StockiestPriorityRepositoryImpl implements StockiestPriorityRepository {
  final StockiestPriorityRemoteDataSource _stockiestPriorityRemoteDataSource;

  StockiestPriorityRepositoryImpl(this._stockiestPriorityRemoteDataSource);

  @override
  Future<Either<BaseError, List<StockiestPriorityModel>>> getStockiestResponses(
      int userId) {
    return _stockiestPriorityRemoteDataSource.getStockiestResponses(userId);
  }

  @override
  Future<Either<BaseError, List<DistributorStoreModel>>>
      getNonMappedDistributor(
          {required String userId, required String retailerId}) {
    return _stockiestPriorityRemoteDataSource.getNonMappedDistributors(
      userId,
      retailerId,
    );
  }

  @override
  Future<Either<BaseError, bool>> saveDistributorPriorities(int userId,
      String stockiestPriorityText, String record, String fieldSep) {
    return _stockiestPriorityRemoteDataSource.saveStockiestPriorities(
        userId, stockiestPriorityText, record, fieldSep);
  }

  @override
  Future<Either<BaseError, List<StoreStatusRequestModel>>>
      sendStoreRequestMapping(Map<String, dynamic> map) {
    return _stockiestPriorityRemoteDataSource.sendStoreRequestMapping(map);
  }

  @override
  Future<Either<BaseError, List<StockiestPriorityModel>>>
      getOrderDistributorResponses() {
    return _stockiestPriorityRemoteDataSource.getOrderDistributorResponses();
  }
}
