
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/local_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class StoreHeaderUseCase
    extends BaseUseCase<BaseError, StoreHeaderParams, bool> {
  final OnboardingRepository onboardingRepository;
  StoreHeaderUseCase(this.onboardingRepository);
  @override
  Future<Either<LocalError, bool>> execute(
      {required StoreHeaderParams params}) {
    return onboardingRepository.saveUserEncodedInfo(params.userEncodedInfo);
  }
}

class StoreHeaderParams extends Params {
  String userEncodedInfo;
  StoreHeaderParams(this.userEncodedInfo);
}
