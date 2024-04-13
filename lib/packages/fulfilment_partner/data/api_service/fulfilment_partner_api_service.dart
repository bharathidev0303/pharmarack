import 'package:dio/dio.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_endpoints.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:retrofit/retrofit.dart';

part 'fulfilment_partner_api_service.g.dart';

/// This class [FulfilmentPartnerApiService] is responsible
/// to include api calls related to the fulfilment_partner feature
/// @RestApi is annotation which generate a g.dart file which contain implementation
/// of all abstract methods
@RestApi()
abstract class FulfilmentPartnerApiService {
  factory FulfilmentPartnerApiService(Dio dio) = _FulfilmentPartnerApiService;

  @POST(FulfilmentPartnerEndpoints.fulfillmentRequest)
  Future<HttpResponse<String>> fetchFulfilmentRequests(
      @Body() Map<String, dynamic> requestBody);

  @POST(FulfilmentPartnerEndpoints.approvalRejectMappingRequest)
  Future<HttpResponse<String>> checkApproveRejectMappingRequest(
      @Body() Map<String, dynamic> requestBody);

  @POST(FulfilmentPartnerEndpoints.mappedSettingsRequest)
  Future<HttpResponse<String>> getMappedSettingsRequest();

  @POST(FulfilmentPartnerEndpoints.saveFulfillmentPartnerSettings)
  Future<HttpResponse<String>> saveFulfillmentPartnerSettings(
      @Query(FulfilmentPartnerOptions.dataForController) String query);
}
