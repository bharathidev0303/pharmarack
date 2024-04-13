import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class SaveSuccessVerifyOtpResponseUseCase extends BaseUseCase<DatabaseError,
    SaveSuccessVerifyOtpResponseUseCaseParams, bool> {
  final OnboardingRepository onboardingRepository;

  SaveSuccessVerifyOtpResponseUseCase(this.onboardingRepository);

  @override
  Future<Either<DatabaseError, bool>> execute(
      {required SaveSuccessVerifyOtpResponseUseCaseParams params}) {
    return onboardingRepository.saveSuccessVerifyOtpResponse(
        OnboardingConstants.otpResponseEntityKey,
        params.verifyOtpResponseEntity);
  }
}

class SaveSuccessVerifyOtpResponseUseCaseParams extends Params {
  VerifyOtpResponseEntity verifyOtpResponseEntity;

  SaveSuccessVerifyOtpResponseUseCaseParams(this.verifyOtpResponseEntity);
}
