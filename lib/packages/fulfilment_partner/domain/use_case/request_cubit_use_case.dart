import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_param.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/repository/fulfilment_partner_repository.dart';

/// This class [RequestCubitUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class RequestCubitUseCase
    extends BaseUseCase<BaseError, RequestParams, RequestModel> {
  final FulfilmentPartnerRepository _fulfilmentPartnerRepository;

  RequestCubitUseCase(this._fulfilmentPartnerRepository);

  @override
  Future<Either<BaseError, RequestModel>> execute(
      {required RequestParams params}) {
    return _fulfilmentPartnerRepository
        .fetchFulfilmentRequests(params.requestParam.requestBody);
  }
}

class RequestParams extends Params {
  final RequestParam requestParam;

  RequestParams(this.requestParam);
}
