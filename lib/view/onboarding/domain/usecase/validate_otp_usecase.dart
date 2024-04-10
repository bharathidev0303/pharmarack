import 'package:fpdart/fpdart.dart';

import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class ValidateOtpUseCase
    extends BaseUseCase<BaseError, ValidateOtpNumberParams, String> {
  final OnboardingRepository _onboardingRepository;
  ValidateOtpUseCase(this._onboardingRepository);

  @override
  Future<Either<BaseError, String>> execute(
      {required ValidateOtpNumberParams params}) {
    return _onboardingRepository.requestValidateOtp(
        params.mobileNumber, params.otp);
  }
}

class ValidateOtpNumberParams extends Params {
  String mobileNumber;
  String otp;
  ValidateOtpNumberParams({required this.mobileNumber, required this.otp});
}
