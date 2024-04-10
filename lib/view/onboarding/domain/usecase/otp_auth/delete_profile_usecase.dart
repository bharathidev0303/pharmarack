
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/delete_profile_model.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';


class RequestDeleteProfileUseCase extends BaseUseCase<BaseError,
    RequestDeleteProfileParams, DeleteProfileModel> {
  final OnboardingRepository onboardingRepository;

  RequestDeleteProfileUseCase({required this.onboardingRepository});
  @override
  Future<Either<BaseError, DeleteProfileModel>> execute(
      {required RequestDeleteProfileParams params}) {
    return onboardingRepository.deleteAccount(params.otp);
  }
}

class RequestDeleteProfileParams extends Params {
  String otp;
  RequestDeleteProfileParams({required this.otp});
}
