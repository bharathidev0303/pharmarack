import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';

class NonMappedDistributorsUseCase extends BaseUseCase<BaseError,
    StockiestPriorityParams, List<DistributorStoreModel>> {
  final StockiestPriorityRepository _stockiestPriorityRepository;

  NonMappedDistributorsUseCase(this._stockiestPriorityRepository);

  @override
  Future<Either<BaseError, List<DistributorStoreModel>>> execute(
      {required StockiestPriorityParams params}) {
    return _stockiestPriorityRepository.getNonMappedDistributor(
        userId: params.stockiestPriorityParam.userId.toString(),
        retailerId:
            (params.stockiestPriorityParam.retailedId?.toString() ?? ""));
  }
}
