
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

import '../../data/entities/check_password_update_status_entity.dart';
import '../../data/entities/forget_password_entity.dart';

class CheckPasswordUpdateUseCase extends BaseUseCase<NetworkError,
    CheckPasswordUpdateParams, ForgetPasswordEntity> {
  final OnboardingRepository onboardingRepository;

  CheckPasswordUpdateUseCase({required this.onboardingRepository});
  @override
  Future<Either<NetworkError, ForgetPasswordEntity>> execute(
      {required CheckPasswordUpdateParams params}) {
    return onboardingRepository.checkPasswordUpdate(
      params.username,
    );
  }
}

class CheckPasswordUpdateParams extends Params {
  String username;

  CheckPasswordUpdateParams({required this.username});
}
