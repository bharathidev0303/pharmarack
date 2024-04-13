import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/api_service/stockiest_priority_api_service.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/store_status_request_model.dart';

/// This class [StockiestPriorityRemoteDataSource] is used to fetch Api from network
/// using [StockiestPriorityApiService] class.
class StockiestPriorityRemoteDataSource {
  final StockiestPriorityApiService _stockiestPriorityApiService;

  StockiestPriorityRemoteDataSource(this._stockiestPriorityApiService);

  Future<Either<BaseError, List<StockiestPriorityModel>>> getStockiestResponses(
      int userId) async {
    final response = await safeApiCall(
        _stockiestPriorityApiService.getStockiestDistributors(userId: userId));

    return response.fold((l) => left(l), (r) {
      final value = r.data.data.map((e) {
        return StockiestPriorityModel.fromStockiestEntity(e);
      }).toList();
      return right(value);
    });
  }

  Future<Either<BaseError, List<StockiestPriorityModel>>>
      getOrderDistributorResponses() async {
    final response =
        await safeApiCall(_stockiestPriorityApiService.getOrderDistributors());

    return response.fold((l) => left(l), (r) {
      final value = r.data.map((e) {
        return StockiestPriorityModel.fromStockiestEntity(e);
      }).toList();
      return right(value);
    });
  }

  Future<Either<BaseError, List<DistributorStoreModel>>>
      getNonMappedDistributors(String userId, String retailerId) async {
    final response = await safeApiCall(_stockiestPriorityApiService
        .getNonMappedStoreStatus(userId: userId, retailerId: retailerId));

    return response.fold((l) => left(l), (r) {
      final value = r.data.map((e) {
        return DistributorStoreModel.fromDistributorsStoreEntity(e);
      }).toList();
      return right(value);
    });
  }

  Future<Either<BaseError, bool>> saveStockiestPriorities(int userId,
      String stockiestPriorityText, String record, String fieldSep) async {
    final response = await safeApiCall(
      _stockiestPriorityApiService.saveDistributorPriorities(
        userId,
        stockiestPriorityText,
        fieldSep,
        record,
      ),
    );
    return response.fold((l) => left(l), (r) {
      return right(r.data.data);
    });
  }

  Future<Either<BaseError, List<StoreStatusRequestModel>>>
      sendStoreRequestMapping(Map<String, dynamic> map) async {
    final response = await safeApiCall(
      _stockiestPriorityApiService.requestStoreMapping(map),
    );

    return response.fold((l) => left(l), (r) {
      final value = r.data.map((e) {
        return StoreStatusRequestModel.fromStockiestEntity(e);
      }).toList();
      return right(value);
    });
  }
}
