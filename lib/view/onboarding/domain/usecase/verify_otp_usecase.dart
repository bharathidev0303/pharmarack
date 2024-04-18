import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class VerifyOtpUseCase extends BaseUseCase<NetworkError, VerifyOtpUseCaseParams,
    VerifyOtpResponseEntity> {
  final OnboardingRepository onboardingRepository;

  VerifyOtpUseCase({required this.onboardingRepository});

  @override
  Future<Either<NetworkError, VerifyOtpResponseEntity>> execute(
      {required VerifyOtpUseCaseParams params}) {
    return onboardingRepository.verifyOtp(params);
  }
}

class VerifyOtpUseCaseParams extends Params {
  String mobileNumber;
  String module;
  String otp;
  String? oneSignalId;

  VerifyOtpUseCaseParams(
      {required this.mobileNumber,
      required this.module,
      required this.otp,
      required this.oneSignalId});
}
