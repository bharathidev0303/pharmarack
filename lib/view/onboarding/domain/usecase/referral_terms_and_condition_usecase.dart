
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class ReferralTermsAndConditionUsecase extends BaseUseCase<NetworkError,
    ReferralTermsAndConditionDataParams, List<String>> {
  final OnboardingRepository onboardingRepository;
  ReferralTermsAndConditionUsecase(this.onboardingRepository);

  @override
  Future<Either<NetworkError, List<String>>> execute({required Params params}) {
    return onboardingRepository.getReferralTAndCResponse();
  }
}

class ReferralTermsAndConditionDataParams extends Params {}
