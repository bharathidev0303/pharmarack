import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';

/// This class [SplashScreenRepository] is the blueprint of network api call
abstract class SplashScreenRepository {
  Future<Either<DatabaseError, bool>> isUserLoggedIn();

  Future<Either<DatabaseError, String?>> getUserEncodedInfo();

  Future<Either<DatabaseError, bool>> isResetPasswordDataAvailable();

  Future<Either<NetworkError, bool>> getRetailerInfo();

  Future<Either<DatabaseError, VerifyOtpResponseEntity?>>
      getVerifyOtpResponse();

  Future<Either<NetworkError, String>> refreshToken(
      String refreshToken, int userId);

  Future<Either<DatabaseError, bool>> updateLoginTokenInfo(
      VerifyOtpResponseEntity verifyOtpResponseEntity, String token);
}
