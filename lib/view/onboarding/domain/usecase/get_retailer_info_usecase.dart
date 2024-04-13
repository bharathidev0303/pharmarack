import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';

import '../repository/onboarding_repository.dart';

class GetRetailerInfoUseCase
    extends BaseUseCase<BaseError, GetRetailerInfoParams, RetailerInfoEntity> {
  final OnboardingRepository _onboardingRepository;
  GetRetailerInfoUseCase(this._onboardingRepository);

  @override
  Future<Either<BaseError, RetailerInfoEntity>> execute(
      {required GetRetailerInfoParams params}) {
    return _onboardingRepository.getRetailerInfo();
  }
}

class GetRetailerInfoParams extends Params {}
