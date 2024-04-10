
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class StoreLoginTokenUseCase
    extends BaseUseCase<BaseError, StoreLoginTokenUseCaseParams, bool> {
  final OnboardingRepository onboardingRepository;

  StoreLoginTokenUseCase(this.onboardingRepository);

  @override
  Future<Either<DatabaseError, bool>> execute(
      {required StoreLoginTokenUseCaseParams params}) {
    return onboardingRepository.saveLoginTokenInfo(params.token);
  }
}

class StoreLoginTokenUseCaseParams extends Params {
  String token;

  StoreLoginTokenUseCaseParams(this.token);
}
