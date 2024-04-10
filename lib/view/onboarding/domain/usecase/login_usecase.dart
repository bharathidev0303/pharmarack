
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/model/login_model.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class LoginUseCase extends BaseUseCase<BaseError, LoginParams, LoginModel> {
  final OnboardingRepository onboardingRepository;
  LoginUseCase(this.onboardingRepository);
  @override
  Future<Either<BaseError, LoginModel>> execute({required LoginParams params}) {
    return onboardingRepository.requestLegacyLogin();
  }
}

class LoginParams extends Params {}
