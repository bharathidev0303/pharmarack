import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/packages/storage_utils/storage_constants.dart';
import 'package:pharmarack/view/features/splash_screen/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:pharmarack/view/features/splash_screen/domain/repository/splash_screen_repository.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../data_source/local_data_source/local_data_source.dart';

class SplashScreenRepositoryImpl implements SplashScreenRepository {
  final SplashScreenLocalDataSource _splashScreenLocalDataSource;
  final SplashScreenRemoteDataSource _splashScreenRemoteDataSource;

  SplashScreenRepositoryImpl(
      this._splashScreenLocalDataSource, this._splashScreenRemoteDataSource);

  @override
  Future<Either<DatabaseError, bool>> isUserLoggedIn() {
    return _splashScreenLocalDataSource
        .isLoginDataAvailable(StorageConstants.loginDataKey);
  }

  @override
  Future<Either<DatabaseError, String?>> getUserEncodedInfo() {
    return _splashScreenLocalDataSource
        .getUserEncodedInfo(StorageConstants.userEncodedHeaderKey);
  }

  @override
  Future<Either<DatabaseError, bool>> isResetPasswordDataAvailable() {
    return _splashScreenLocalDataSource.isResetPasswordDataAvailable();
  }

  @override
  Future<Either<NetworkError, bool>> getRetailerInfo() {
    return _splashScreenRemoteDataSource.getRetailerInfo();
  }

  @override
  Future<Either<DatabaseError, VerifyOtpResponseEntity?>>
      getVerifyOtpResponse() {
    return _splashScreenLocalDataSource
        .getSuccessVerifyOtpResponse(OnboardingConstants.otpResponseEntityKey);
  }

  @override
  Future<Either<NetworkError, String>> refreshToken(
      String refreshToken, int userId) {
    return _splashScreenRemoteDataSource.refreshToken(refreshToken, userId);
  }

  @override
  Future<Either<DatabaseError, bool>> updateLoginTokenInfo(
      VerifyOtpResponseEntity verifyOtpResponseEntity, String token) {
    return _splashScreenLocalDataSource.updateLoginTokenInfo(
        verifyOtpResponseEntity, token);
  }
}
