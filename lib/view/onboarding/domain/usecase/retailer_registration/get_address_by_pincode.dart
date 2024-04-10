
import 'package:fpdart/fpdart.dart';

import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/pincode_data.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class GetAddressByPinCodeUseCase
    extends BaseUseCase<BaseError, PincodeDataParams, PincodeDataModel> {
  final OnboardingRepository _onboardingRepository;
  GetAddressByPinCodeUseCase(this._onboardingRepository);

  @override
  Future<Either<BaseError, PincodeDataModel>> execute(
      {required PincodeDataParams params}) {
    Map<String, String> getRequestString() {
      var reqMap = {'pincode': params.pincode};
      return reqMap;
    }

    return _onboardingRepository.getAddressByPinCode(getRequestString());
  }
}

class PincodeDataParams extends Params {
  String pincode;
  PincodeDataParams({required this.pincode});
}
