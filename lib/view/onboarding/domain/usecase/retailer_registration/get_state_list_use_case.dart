
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/state.dart';


import '../../repository/onboarding_repository.dart';

class GetStatesUseCase
    extends BaseUseCase<BaseError, GetStatesParams, List<AddressStateModel>> {
  final OnboardingRepository _onboardingRepository;
  GetStatesUseCase(this._onboardingRepository);
  @override
  Future<Either<BaseError, List<AddressStateModel>>> execute(
      {required GetStatesParams params}) {
    return _onboardingRepository.getStateList();
  }
}

class GetStatesParams extends Params {}
