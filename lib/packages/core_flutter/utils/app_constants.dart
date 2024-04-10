import 'package:rxdart/rxdart.dart';

class AppConstants {
  AppConstants._();

  static PublishSubject<bool> dropDownHandler = PublishSubject();

  static const String legacyBaseUrlDioConstant = "legacyBaseUrlDioConstant";
  static const String baseUrlDioConstant = "baseUrlDioConstant";
  static const String cmsGatewayBaseUrlDioConstant =
      "cmsGatewayBaseUrlDioConstant";
  static const String flyBaseUrlDioConstant = "flyBaseUrlDioConstant";
  static const String legacyBaseUrlUserAuthManager =
      "legacyBaseUrlUserAuthManager";
  static const String baseUrlUserAuthManager = "baseUrlUserAuthManager";
  static const String commonSuccessDialogKey = "commonSuccessDialogKey";
  static const String commonFailureDialogKey = "commonFailureDialogKey";
  static const apiVersion = 'v1';
  static const countDownTime = 60;
}
