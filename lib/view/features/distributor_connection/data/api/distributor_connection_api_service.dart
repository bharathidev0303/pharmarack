import 'package:dio/dio.dart';
import 'package:pharmarack/view/features/distributor_connection/data/model/multiple_store_mapping_response_model.dart';
import 'package:pharmarack/view/features/distributor_connection/domain/model/save_retailer_store_response.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_response_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../distributor_connection_constants.dart';

part 'distributor_connection_api_service.g.dart';

@RestApi()
abstract class DistributorConnectionApiService {
  factory DistributorConnectionApiService(Dio dio) =
      _DistributorConnectionApiService;

  @GET(DistributorConnectionConstants.pathNonmappedStoreStatus)
  Future<DistributorStoreResponseModel> getNonmappedStoreStatus({
    @Query(DistributorConnectionConstants.paramRetailerId)
    required String retailerId,
    @Query(DistributorConnectionConstants.paramUserId) required String userId,
  });

  @POST(DistributorConnectionConstants.pathStoreMappingRequest)
  Future<HttpResponse<MultipleStoreMappingResponseModel>> requestStoreMapping(
    @Body() Map<String, dynamic> request,
  );

  @POST(DistributorConnectionConstants.saveRetailerStoreRequest)
  Future<SaveRetailerStoreResponse> saveRetailerStoreRequest(
      @Body() Map<String, dynamic> request);
}
