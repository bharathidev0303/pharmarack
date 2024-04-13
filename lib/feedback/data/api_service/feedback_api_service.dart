import 'package:dio/dio.dart' hide Headers;
import 'package:pharmarack/feedback/data/endpoint_constants/feedback_api_endpoints.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/common_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'feedback_api_service.g.dart';

@RestApi()
abstract class FeedbackApiService {
  factory FeedbackApiService(Dio dio) = _FeedbackApiService;

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(FeedbackApiEndpoints.saveFeedbackType)
  Future<HttpResponse<CommonResponseEntity<dynamic>>> saveFeedback(
      @Body() Map<String, dynamic> requestBody);
}
