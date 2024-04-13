import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_param.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';

/// This class [StockiestPriorityUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class StockiestPriorityUseCase extends BaseUseCase<BaseError,
    StockiestPriorityParams, List<StockiestPriorityModel>> {
  final StockiestPriorityRepository _stockiestPriorityRepository;

  StockiestPriorityUseCase(this._stockiestPriorityRepository);

  @override
  Future<Either<BaseError, List<StockiestPriorityModel>>> execute(
      {required StockiestPriorityParams params}) {
    return _stockiestPriorityRepository
        .getStockiestResponses(params.stockiestPriorityParam.userId);
  }

  @override
  Future<Either<BaseError, List<StockiestPriorityModel>>>
      orderDistributorExecute() {
    return _stockiestPriorityRepository.getOrderDistributorResponses();
  }
}

class StockiestPriorityParams extends Params {
  final StockiestPriorityParam stockiestPriorityParam;

  StockiestPriorityParams(this.stockiestPriorityParam);
}
