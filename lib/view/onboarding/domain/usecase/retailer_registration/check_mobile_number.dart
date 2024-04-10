
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

import '../../model/retailer_registration/mobile_number.dart';

class CheckMobileNumberUseCase extends BaseUseCase<BaseError,
    VerifyMobileNumberParams, MobileNumberModel> {
  final OnboardingRepository _onboardingRepository;
  CheckMobileNumberUseCase(this._onboardingRepository);

  @override
  Future<Either<BaseError, MobileNumberModel>> execute(
      {required VerifyMobileNumberParams params}) {
    final Map<String, dynamic> payLoad = {
      'userid': params.userID,
      'mobileno': params.mobileNumber
    };
    return _onboardingRepository.checkMobileNumber(payLoad);
  }
}

class VerifyMobileNumberParams extends Params {
  String mobileNumber;
  int userID;
  VerifyMobileNumberParams({required this.mobileNumber, required this.userID});
}
