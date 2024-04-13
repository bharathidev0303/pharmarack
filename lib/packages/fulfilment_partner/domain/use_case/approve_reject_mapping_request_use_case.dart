import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/approve_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_param.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/repository/fulfilment_partner_repository.dart';

/// This class [RequestCubitUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class ApproveRejectMappingUseCase extends BaseUseCase<BaseError,
    ApproveRejectParams, ApproveRejectMappingModel> {
  final FulfilmentPartnerRepository _fulfilmentPartnerRepository;

  ApproveRejectMappingUseCase(this._fulfilmentPartnerRepository);

  @override
  Future<Either<BaseError, ApproveRejectMappingModel>> execute(
      {required ApproveRejectParams params}) {
    return _fulfilmentPartnerRepository
        .checkApproveRejectMapping(params.requestParam.requestBody);
  }
}

class ApproveRejectParams extends Params {
  final RequestParam requestParam;

  ApproveRejectParams(this.requestParam);
}
