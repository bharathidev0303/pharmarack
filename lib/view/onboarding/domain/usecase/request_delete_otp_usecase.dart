
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/model/delete_account_otp_model.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';


class RequestDeleteOtpUseCase
    extends BaseUseCase<BaseError, RequestDeleteParams, DeleteAccountOtpModel> {
  final OnboardingRepository onboardingRepository;

  RequestDeleteOtpUseCase({required this.onboardingRepository});
  @override
  Future<Either<BaseError, DeleteAccountOtpModel>> execute(
      {required RequestDeleteParams params}) {
    return onboardingRepository.getOtpForDeleteProfile();
  }
}

class RequestDeleteParams extends Params {
  RequestDeleteParams();
}
