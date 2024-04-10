
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class DeleteResetPasswordDataUseCase
    extends BaseUseCase<BaseError, DeleteResetPasswordDataParams, bool> {
  final OnboardingRepository onboardingRepository;

  DeleteResetPasswordDataUseCase({required this.onboardingRepository});

  @override
  Future<Either<BaseError, bool>> execute(
      {required DeleteResetPasswordDataParams params}) {
    return onboardingRepository.deleteResetPasswordData();
  }
}

class DeleteResetPasswordDataParams extends Params {}
