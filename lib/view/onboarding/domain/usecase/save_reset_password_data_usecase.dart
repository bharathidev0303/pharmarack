
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class SaveResetPasswordDataUseCase
    extends BaseUseCase<BaseError, SaveResetPasswordDataParams, bool> {
  final OnboardingRepository onboardingRepository;

  SaveResetPasswordDataUseCase({required this.onboardingRepository});

  @override
  Future<Either<BaseError, bool>> execute(
      {required SaveResetPasswordDataParams params}) {
    return onboardingRepository.storeChangePasswordInfo(
        params.oldPassword, params.userName, params.userId);
  }
}

class SaveResetPasswordDataParams extends Params {
  String oldPassword;
  String userName;
  int userId;

  SaveResetPasswordDataParams(
      {required this.oldPassword,
      required this.userName,
      required this.userId});
}
