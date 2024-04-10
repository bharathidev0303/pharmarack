
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class CheckGSTNumberUseCase
    extends BaseUseCase<BaseError, VerifyGSTNumberParams, String> {
  final OnboardingRepository _onboardingRepository;
  CheckGSTNumberUseCase(this._onboardingRepository);

  @override
  Future<Either<BaseError, String>> execute(
      {required VerifyGSTNumberParams params}) {
    final payLoad = {'GSTIN': params.gstNumber};
    return _onboardingRepository.checkGSTNumber(payLoad);
  }
}

class VerifyGSTNumberParams extends Params {
  String gstNumber;
  VerifyGSTNumberParams({required this.gstNumber});
}
