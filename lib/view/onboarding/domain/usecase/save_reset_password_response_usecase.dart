
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../../data/entities/reset_password_response_entity.dart';
import '../model/reset_password_model.dart';

class SaveResetPasswordResponseUseCase extends BaseUseCase<DatabaseError,
    SaveResetPasswordResponseUseCaseParams, bool> {
  final OnboardingRepository onboardingRepository;

  SaveResetPasswordResponseUseCase(this.onboardingRepository);

  @override
  Future<Either<DatabaseError, bool>> execute(
      {required SaveResetPasswordResponseUseCaseParams params}) {
    return onboardingRepository.saveResetPasswordResponse(
        OnboardingConstants.resendPasswordResponseEntityKey,
        params.resetPasswordEntity);
  }
}

class SaveResetPasswordResponseUseCaseParams extends Params {
  ResetPasswordEntity resetPasswordEntity;

  SaveResetPasswordResponseUseCaseParams(this.resetPasswordEntity);
}
