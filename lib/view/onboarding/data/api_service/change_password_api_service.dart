
import 'package:dio/dio.dart';
import 'package:pharmarack/packages/common_entity/common_response_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../endpoints_constants/onboarding_endpoints.dart';

part 'change_password_api_service.g.dart';

@RestApi()
abstract class ChangePasswordApiService {
  factory ChangePasswordApiService(Dio dio) = _ChangePasswordApiService;

  @POST(OnboardingEndpoints.changePassword)
  Future<CommonResponseEntity> changePassword(
    @Body() Map<String, dynamic> requestBody,
  );
}
