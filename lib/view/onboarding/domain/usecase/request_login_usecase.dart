
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

import '../../data/entities/login_response_entity.dart';

class RequestLoginUseCase
    extends BaseUseCase<BaseError, RequestLoginParams, LoginResponseEntity> {
  final OnboardingRepository onboardingRepository;

  RequestLoginUseCase(this.onboardingRepository);

  @override
  Future<Either<NetworkError, LoginResponseEntity>> execute(
      {required RequestLoginParams params}) async {
    return onboardingRepository.requestLogin(params.userName, params.password);
  }
}

class RequestLoginParams extends Params {
  String userName;
  String password;

  RequestLoginParams({required this.userName, required this.password});
}
