import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/store_status_request_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';

class StoreRequestMappingUseCase extends BaseUseCase<BaseError,
    StoreRequestMappingParams, List<StoreStatusRequestModel>> {
  final StockiestPriorityRepository _stockiestPriorityRepository;

  StoreRequestMappingUseCase(
      {required StockiestPriorityRepository stockiestPriorityRepository})
      : _stockiestPriorityRepository = stockiestPriorityRepository;

  @override
  Future<Either<BaseError, List<StoreStatusRequestModel>>> execute(
      {required StoreRequestMappingParams params}) {
    return _stockiestPriorityRepository
        .sendStoreRequestMapping(params.storeRequestMappingParam.map);
  }
}

class StoreRequestMappingParams extends Params {
  final StoreRequestMappingParam storeRequestMappingParam;

  StoreRequestMappingParams(this.storeRequestMappingParam);
}

class StoreRequestMappingParam {
  final Map<String, dynamic> map;

  StoreRequestMappingParam(this.map);
}
