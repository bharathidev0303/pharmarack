import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_param.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/repository/fulfilment_partner_repository.dart';

class SavedMappedSettingsUseCase
    extends BaseUseCase<BaseError, SavedMappedSettingsParams, String> {
  final FulfilmentPartnerRepository _fulfilmentPartnerRepository;

  SavedMappedSettingsUseCase(this._fulfilmentPartnerRepository);

  @override
  Future<Either<BaseError, String>> execute(
      {required SavedMappedSettingsParams params}) {
    return _fulfilmentPartnerRepository
        .saveFulfillmentPartnerSettings(params.param.query);
  }
}

class SavedMappedSettingsParams extends Params {
  final SaveMappedSettingsParam param;

  SavedMappedSettingsParams(this.param);
}
