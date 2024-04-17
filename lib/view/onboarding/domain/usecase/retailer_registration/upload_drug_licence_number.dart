import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';
import 'package:http_parser/http_parser.dart';

class UploadDrugLicenceUseCase
    extends BaseUseCase<BaseError, UploadDLParams, String> {
  final OnboardingRepository _onboardingRepository;
  UploadDrugLicenceUseCase(this._onboardingRepository);

  @override
  Future<Either<BaseError, String>> execute(
      {required UploadDLParams params}) async {
    final payLoad = FormData.fromMap({
      'file': await MultipartFile.fromFile(params.drugLicenceFilePath,
          filename: params.drugLicenceFilePath.split("/").last,
          contentType: MediaType(
              "image", params.drugLicenceFilePath.toString().split(".").last))
    });

    return _onboardingRepository.uploadDLServer(
        payLoad, params.type, params.userId);
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
