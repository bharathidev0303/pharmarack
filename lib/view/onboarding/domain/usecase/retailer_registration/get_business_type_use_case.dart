
import 'package:fpdart/fpdart.dart';

import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/business_type.dart';

import '../../repository/onboarding_repository.dart';

class GetBusinessTypeUseCase extends BaseUseCase<BaseError,
    GetBusinessTypeParams, List<BusinessTypeModel>> {
  final OnboardingRepository _onboardingRepository;
  GetBusinessTypeUseCase(this._onboardingRepository);

  @override
  Future<Either<BaseError, List<BusinessTypeModel>>> execute(
      {required GetBusinessTypeParams params}) {
    return _onboardingRepository.getBusinessType();
  }
}

class GetBusinessTypeParams extends Params {}
