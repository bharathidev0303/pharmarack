import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';

class SaveDistributorPrioritiesUseCase
    extends BaseUseCase<BaseError, SaveDistributorPrioritiesParams, dynamic> {
  final StockiestPriorityRepository _stockiestPriorityRepository;

  SaveDistributorPrioritiesUseCase(
      {required StockiestPriorityRepository stockiestPriorityRepository})
      : _stockiestPriorityRepository = stockiestPriorityRepository;

  @override
  Future<Either<BaseError, bool>> execute(
      {required SaveDistributorPrioritiesParams params}) {
    return _stockiestPriorityRepository.saveDistributorPriorities(
        params.saveDistributorPrioritiesParam.userId,
        params.saveDistributorPrioritiesParam.storePriorityText,
        params.saveDistributorPrioritiesParam.recordSep,
        params.saveDistributorPrioritiesParam.fieldSep);
  }
}

class SaveDistributorPrioritiesParams extends Params {
  final SaveDistributorPrioritiesParam saveDistributorPrioritiesParam;

  SaveDistributorPrioritiesParams(this.saveDistributorPrioritiesParam);
}

class SaveDistributorPrioritiesParam {
  final int userId;
  final String storePriorityText;
  final String recordSep;
  final String fieldSep;

  SaveDistributorPrioritiesParam(
      this.userId, this.storePriorityText, this.recordSep, this.fieldSep);
}
