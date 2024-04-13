import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/packages/core_flutter/error/local_error.dart';
import 'package:pharmarack/packages/storage_utils/storage.dart';
import 'package:pharmarack/packages/storage_utils/storage_constants.dart';
import 'package:pharmarack/packages/storage_utils/storage_factory.dart';

import '../../entities/reset_password_response_entity.dart';

class OnboardingLocalDBService {
  final String _boxName;
  late Storage _storage;
  late Storage _secureStorage;

  OnboardingLocalDBService(this._boxName) {
    _storage = StorageFactory.getStorage(isSecure: false, boxName: _boxName);
    _secureStorage = StorageFactory.getStorage(isSecure: true);
  }

  Future<void> clearStorage() async {
    _storage.clear();
    _secureStorage.clear();
  }

  Future<Either<DatabaseError, bool>> saveLoginData(
      String key, LoginEntity value) async {
    try {
      _storage.setItem(key: key, value: LoginEntity.serialize(value));
      return const Right(true);
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }

  Future<Either<DatabaseError, bool>> saveSuccessVerifyOtpResponse(
      String key, VerifyOtpResponseEntity value) async {
    try {
      _secureStorage.setItem(
          key: key,
          value: VerifyOtpResponseEntity.serialize(VerifyOtpResponseEntity(
              token: value.token,
              refreshToken: value.refreshToken,
              expiryTime: (double.parse(value.expiryTime!) +
                      DateTime.now().millisecondsSinceEpoch)
                  .toString(),
              userData: value.userData)));
      _secureStorage.setItem(
          key: StorageConstants.authToken, value: value.token!);
      _storage.setBoolItem(
          key: StorageConstants.authTokenAvailabilityKey, value: true);
      return const Right(true);
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }

  Future<Either<DatabaseError, bool>> saveResetPasswordResponse(
      String key, ResetPasswordEntity value) async {
    try {
      _secureStorage.setItem(
          key: key,
          value: ResetPasswordEntity.serialize(ResetPasswordEntity(
              token: value.token,
              refreshToken: value.refreshToken,
              refreshtokenExpiryTime: value.refreshtokenExpiryTime,
              gcmregistration: value.gcmregistration,
              expiryTime: (double.parse(value.expiryTime!) +
                      DateTime.now().millisecondsSinceEpoch)
                  .toString(),
              users: value.users)));
      _secureStorage.setItem(
          key: StorageConstants.authToken, value: value.token!);
      _storage.setBoolItem(
          key: StorageConstants.authTokenAvailabilityKey, value: true);
      return const Right(true);
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }

  Future<Either<LocalError, bool>> storeUserEncodedInfo(
      String encodedString) async {
    try {
      _secureStorage.setItem(
          key: StorageConstants.userEncodedHeaderKey, value: encodedString);
      return const Right(true);
    } on Exception catch (throwable) {
      return Left(
        LocalError(
            message: throwable.toString(), cause: throwable, localError: 0),
      );
    }
  }

  Future<Either<DatabaseError, bool>> storeResetPasswordData(
      String oldPassword, String userName, int userId) async {
    try {
      _storage.setIntItem(key: StorageConstants.userIdKey, value: userId);
      _storage.setItem(key: userId.toString(), value: userName);
      _secureStorage.setItem(key: userId.toString(), value: oldPassword);
      return const Right(true);
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }

  Future<Either<DatabaseError, (int, String, String)>>
      getResetPasswordData() async {
    try {
      final userId = await _storage.getIntItem(key: StorageConstants.userIdKey);
      if (userId == null || userId == 0) {
        return Left(DatabaseError(
            cause: Exception(),
            message: "No data available",
            databaseError: 0));
      } else {
        final oldPassword =
            await _secureStorage.getItem(key: userId.toString());
        final userName = await _storage.getItem(key: userId.toString());
        if (oldPassword != null && userName != null) {
          return Right((userId, userName, oldPassword));
        } else {
          return Left(DatabaseError(
              cause: Exception(),
              message: "No data available",
              databaseError: 0));
        }
      }
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }

  Future<Either<DatabaseError, bool>> saveLoginTokenInfo(String token) async {
    try {
      _secureStorage.setItem(key: StorageConstants.authToken, value: token);
      return const Right(true);
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }

  Future<Either<DatabaseError, bool>> deleteResetPasswordData() async {
    try {
      final userId = await _storage.getIntItem(key: StorageConstants.userIdKey);
      if (userId == null || userId == 0) {
        return const Right(false);
      } else {
        _secureStorage.deleteItem(key: userId.toString());
        _storage.deleteItem(key: userId.toString());
        return const Right(true);
      }
    } on Exception catch (throwable) {
      return Left(
        DatabaseError(
            message: throwable.toString(), cause: throwable, databaseError: 0),
      );
    }
  }
}
