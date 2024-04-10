
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/model/forget_password_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/forget_password_params.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';


class RequestForgetPasswordUseCase extends BaseUseCase<BaseError,
    RequestForgetPasswordParams, ForgetPasswordModel> {
  final OnboardingRepository onboardingRepository;

  RequestForgetPasswordUseCase({required this.onboardingRepository});
  @override
  Future<Either<BaseError, ForgetPasswordModel>> execute(
      {required RequestForgetPasswordParams params}) {
    return onboardingRepository.requestForgetPassword(
      params.forgetPasswordParams.mobileNumber,
      params.forgetPasswordParams.email,
    );
  }
}

class RequestForgetPasswordParams extends Params {
  ForgetPasswordParams forgetPasswordParams;

  RequestForgetPasswordParams({required this.forgetPasswordParams});
}
