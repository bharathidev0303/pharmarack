import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class SaveLoginDataUseCase
    extends BaseUseCase<BaseError, SaveLoginDataParams, bool> {
  final OnboardingRepository onboardingRepository;
  SaveLoginDataUseCase(this.onboardingRepository);
  @override
  Future<Either<DatabaseError, bool>> execute(
      {required SaveLoginDataParams params}) {
    return onboardingRepository.saveLoginData(params.key, params.loginEntity);
  }
}

class SaveLoginDataParams extends Params {
  LoginEntity loginEntity;
  String key;
  SaveLoginDataParams(this.loginEntity, this.key);
}
