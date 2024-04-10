import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/onboarding/data/api_service/onboarding_api_service.dart';

class SplashScreenRemoteDataSource {
  final OnboardingApiService _onboardingApiService;
  // final OnboardingLegacyApiService _onboardingLegacyApiService;

  SplashScreenRemoteDataSource(this._onboardingApiService);

  Future<Either<NetworkError, bool>> getRetailerInfo() async {
    final retailerInfoResponse =
        await safeApiCall(_onboardingApiService.getRetailerInfo());
    //Todo: Need to remove this call once complete new api migration is done
    // final oldLoginInfoResponse =
    //     await safeApiCall(_onboardingLegacyApiService.requestLogin());
    // oldLoginInfoResponse.fold((l) => null, (r) {
    //   if (getIt.isRegistered<LoginEntity>()) {
    //     getIt.unregister<LoginEntity>();
    //   }
    //   getIt.registerSingleton<LoginEntity>(
    //       LoginEntity.fromJson(json.decode(r.data)));
    // });
    return retailerInfoResponse.fold((l) => left(l), (r) {
      if (getIt.isRegistered<RetailerInfoEntity>()) {
        getIt.unregister<RetailerInfoEntity>();
      }
      getIt.registerSingleton<RetailerInfoEntity>(r.data.data!);
      debugPrint('RetailerResp: ${r.data.data!.distributorId}');
      return right(true);
    });
  }

  Future<Either<NetworkError, String>> refreshToken(
      String refreshToken, int userId) async {
    final refreshTokenResponse = await safeApiCall(
        _onboardingApiService.refreshToken(refreshToken, userId));
    return refreshTokenResponse.fold((l) => left(l), (r) {
      return right(r.data.data!.token!);
    });
  }
}
