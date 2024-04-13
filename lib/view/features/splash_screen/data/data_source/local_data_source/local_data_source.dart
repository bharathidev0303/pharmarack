import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/packages/storage_utils/storage.dart';
import 'package:pharmarack/packages/storage_utils/storage_constants.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

/// This class [LocalDataSource] is used to store data in Either
/// [Hive] or [FlutterSecureStorage] based on use case
class SplashScreenLocalDataSource {
  final Storage _secureStorage;
  final Storage _storage;

  SplashScreenLocalDataSource(this._secureStorage, this._storage);

  Future<Either<DatabaseError, bool>> isLoginDataAvailable(String key) async {
    try {
      bool? isAutoLoginAvailable = await _storage.getBoolItem(
          key: StorageConstants.authTokenAvailabilityKey);
      String? loginToken =
          await _secureStorage.getItem(key: StorageConstants.authToken);
      if (loginToken != null &&
          isAutoLoginAvailable != null &&
          isAutoLoginAvailable == true) {
        return const Right(true);
      }
      return const Right(false);
    } on Exception catch (e) {
      return Left(
        DatabaseError(message: e.toString(), cause: e, databaseError: 2),
      );
    }
  }

  Future<Either<DatabaseError, VerifyOtpResponseEntity?>>
      getSuccessVerifyOtpResponse(String key) async {
    try {
      bool? isAutoLoginAvailable = await _storage.getBoolItem(
          key: StorageConstants.authTokenAvailabilityKey);
      String? successVerifyOtpResponse = await _secureStorage.getItem(key: key);
      if (isAutoLoginAvailable != null &&
          isAutoLoginAvailable == true &&
          successVerifyOtpResponse != null) {
        return Right(
            VerifyOtpResponseEntity.deserialize(successVerifyOtpResponse));
      }
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        DatabaseError(message: e.toString(), cause: e, databaseError: 2),
      );
    }
  }

  Future<Either<DatabaseError, bool>> updateLoginTokenInfo(
      VerifyOtpResponseEntity verifyOtpResponseEntity, String token) async {
    try {
      _secureStorage.setItem(key: StorageConstants.authToken, value: token);
      _secureStorage.setItem(
          key: OnboardingConstants.otpResponseEntityKey,
          value: VerifyOtpResponseEntity.serialize(VerifyOtpResponseEntity(
              token: verifyOtpResponseEntity.token,
              refreshToken: verifyOtpResponseEntity.refreshToken,
              expiryTime:
                  (DateTime.now().millisecondsSinceEpoch + 86400000).toString(),
              userData: verifyOtpResponseEntity.userData)));
      return const Right(true);
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }

  Future<Either<DatabaseError, String?>> getUserEncodedInfo(String key) async {
    try {
      String? userEncodedInfo = await _secureStorage.getItem(key: key);
      if (userEncodedInfo != null) {
        return Right(userEncodedInfo);
      }
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        DatabaseError(message: e.toString(), cause: e, databaseError: 2),
      );
    }
  }

  Future<Either<DatabaseError, bool>> isResetPasswordDataAvailable() async {
    try {
      final userId = await _storage.getIntItem(key: StorageConstants.userIdKey);
      if (userId == null || userId == 0) {
        return const Right(false);
      } else {
        final oldPassword =
            await _secureStorage.getItem(key: userId.toString());
        final userName = await _storage.getItem(key: userId.toString());
        if (oldPassword != null && userName != null) {
          return const Right(true);
        } else {
          return const Right(false);
        }
      }
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }
}
