
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class GetResetPasswordDataUseCase extends BaseUseCase<BaseError,
    GetResetPasswordDataParams, (int, String, String)> {
  final OnboardingRepository onboardingRepository;

  GetResetPasswordDataUseCase({required this.onboardingRepository});

  @override
  Future<Either<BaseError, (int, String, String)>> execute(
      {required GetResetPasswordDataParams params}) {
    return onboardingRepository.getChangePasswordData();
  }
}

class GetResetPasswordDataParams extends Params {}
