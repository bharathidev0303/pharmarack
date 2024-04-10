
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

import '../../data/entities/reset_password_response_entity.dart';

class RequestResetPasswordUseCase extends BaseUseCase<BaseError,
    RequestResetPasswordParams, ResetPasswordResponseEntity> {
  final OnboardingRepository onboardingRepository;

  RequestResetPasswordUseCase({required this.onboardingRepository});

  @override
  Future<Either<BaseError, ResetPasswordResponseEntity>> execute(
      {required RequestResetPasswordParams params}) {
    return onboardingRepository.requestResetPassword(
        params.mobileNumber, params.otp, params.newPassword);
  }
}

class RequestResetPasswordParams extends Params {
  String mobileNumber;
  String otp;
  String newPassword;

  RequestResetPasswordParams({
    required this.mobileNumber,
    required this.otp,
    required this.newPassword,
  });
}
