import 'package:dio/dio.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/common_response_entity.dart';
import 'package:pharmarack/view/onboarding/data/entities/reset_password_response_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../endpoints_constants/onboarding_endpoints.dart';

part 'change_password_api_service.g.dart';

@RestApi()
abstract class ChangePasswordApiService {
  factory ChangePasswordApiService(Dio dio) = _ChangePasswordApiService;

  @POST(OnboardingEndpoints.changePassword)
  Future<HttpResponse<ResetPasswordEntity>> changePassword(
    @Body() Map<String, dynamic> requestBody,
  );
}
