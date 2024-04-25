import 'package:pharmarack/auth/user_auth_manager.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_local_data_source/local_data_source.dart';
import 'package:pharmarack/view/features/splash_screen/domain/repository/splash_screen_repository.dart';

class AutoLoginUtils {
  final SplashScreenRepository splashScreenRepository;
  final UserAuthManager legacyUserAuthManager;
  final UserAuthManager userAuthManager;
  final CommonLocalDataSource commonLocalDataSource;

  const AutoLoginUtils({
    required this.splashScreenRepository,
    required this.legacyUserAuthManager,
    required this.userAuthManager,
    required this.commonLocalDataSource,
  });

  Future<bool> getRetailerInfo() async {
    final response = await splashScreenRepository.getRetailerInfo();
    return response.fold((l) {
      if (l?.error.message == 'Something went wrong') {
        return false;
      } else {
        commonLocalDataSource.clearStorage();
        return false;
      }
    }, (r) => r);
  }

  Future<bool> checkTokenExpiration() async {
    final verifyOtpResponse =
        await splashScreenRepository.getVerifyOtpResponse();
    return verifyOtpResponse.fold((l) {
      commonLocalDataSource.clearStorage();
      return false;
    }, (r) async {
      if (r != null) {
        if (_isTokenExpired(double.parse(r.expiryTime!))) {
          userAuthManager.clearAuthToken();
          await _refreshToken(r);
          await legacyUserAuthManager.refreshAuthHeader();
          return await getRetailerInfo();
        } else {
          await updateAuthHeaders();
          return await getRetailerInfo();
        }
      } else {
        commonLocalDataSource.clearStorage();
        return false;
      }
    });
  }

  bool _isTokenExpired(double expirationTime) {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime >= expirationTime) {
      return true;
    }
    return false;
  }

  Future<void> _refreshToken(
      VerifyOtpResponseEntity verifyOtpResponseEntity) async {
    final refreshTokenResponse = await splashScreenRepository.refreshToken(
        verifyOtpResponseEntity.refreshToken!,
        verifyOtpResponseEntity.userData!.userId!);
    refreshTokenResponse.fold((l) => null, (r) async {
      userAuthManager.setAuthHeaders(UserAuthManager.authTokenKey, r);
      await _storeUpdatedAuthToken(verifyOtpResponseEntity, r);
    });
  }

  Future<void> _storeUpdatedAuthToken(
      VerifyOtpResponseEntity verifyOtpResponseEntity, String token) async {
    await splashScreenRepository.updateLoginTokenInfo(
        verifyOtpResponseEntity, token);
  }

  Future<void> updateAuthHeaders() async {
    await userAuthManager.setAuthToken();
    await legacyUserAuthManager.refreshAuthHeader();
  }

  Future<bool> isUserLoggedIn() async {
    final result = await splashScreenRepository.isUserLoggedIn();
    return result.fold((l) => false, (r) => r);
  }

  Future<bool> isResetPasswordAvailable() async {
    final result = await splashScreenRepository.isResetPasswordDataAvailable();
    return result.fold((l) => false, (r) => r);
  }
}
