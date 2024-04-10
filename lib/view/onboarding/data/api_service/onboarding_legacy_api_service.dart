import 'package:dio/dio.dart' hide Headers;
import 'package:pharmarack/packages/common_entity/login_entity.dart';
import 'package:pharmarack/view/onboarding/data/endpoints_constants/onboarding_endpoints.dart';

import 'package:retrofit/retrofit.dart';

part 'onboarding_legacy_api_service.g.dart';

@RestApi()
abstract class OnboardingLegacyApiService {
  factory OnboardingLegacyApiService(Dio dio) = _OnboardingLegacyApiService;

  @POST(OnboardingEndpoints.legacyLogin)
  Future<HttpResponse<String>> requestLogin();

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.legacyLogin)
  Future<HttpResponse<LoginEntity>> requestOtpLogin(
      @Body() Map<String, dynamic> requestBody);
}
