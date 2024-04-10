
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';


class UploadDrugLicenceUseCase
    extends BaseUseCase<BaseError, UploadDLParams, String> {
  final OnboardingRepository _onboardingRepository;
  UploadDrugLicenceUseCase(this._onboardingRepository);

  @override
  Future<Either<BaseError, String>> execute(
      {required UploadDLParams params}) async {
    final payLoad = {
      'file': await MultipartFile.fromFile(params.drugLicenceFilePath)
    };
    return _onboardingRepository.uploadDLServer(
        FormData.fromMap(payLoad), params.type, params.userId);
  }
}

class UploadDLParams extends Params {
  String drugLicenceFilePath;
  String type;
  String userId;
  UploadDLParams({
    required this.drugLicenceFilePath,
    required this.type,
    required this.userId,
  });
}
