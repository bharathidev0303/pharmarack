
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/data/entities/otp_login_api_payload_entity.dart';
import 'package:pharmarack/view/onboarding/domain/model/login_model.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class RequestOtpLoginUseCase
    extends BaseUseCase<BaseError, RequestOtpLoginParams, LoginModel> {
  final OnboardingRepository onboardingRepository;

  RequestOtpLoginUseCase({required this.onboardingRepository});

  @override
  Future<Either<BaseError, LoginModel>> execute(
      {required RequestOtpLoginParams params}) {
    return onboardingRepository
        .requestOtpLogin(params.otpLoginApiPayloadEntity);
  }
}

class RequestOtpLoginParams extends Params {
  OtpLoginApiPayloadEntity otpLoginApiPayloadEntity;

  RequestOtpLoginParams({required this.otpLoginApiPayloadEntity});
}
