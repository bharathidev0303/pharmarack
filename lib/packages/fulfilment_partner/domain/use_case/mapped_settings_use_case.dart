import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/repository/fulfilment_partner_repository.dart';

class MappedSettingsUseCase
    extends BaseUseCase<BaseError, MappedSettingsParams, MappedSettingsModel> {
  final FulfilmentPartnerRepository _fulfilmentPartnerRepository;

  MappedSettingsUseCase(this._fulfilmentPartnerRepository);

  @override
  Future<Either<BaseError, MappedSettingsModel>> execute(
      {required MappedSettingsParams params}) {
    return _fulfilmentPartnerRepository.getMappedSettings();
  }
}

class MappedSettingsParams extends Params {}
