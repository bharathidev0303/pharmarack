import 'package:dio/dio.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/endpoints_constants/stockiest_priority_endpoints.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/endpoints_constants/stockiest_priority_options.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/model/distributor_store_entity.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/model/stockiest_entity.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/model/store_status_mapping_request_entity.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/save_distributor_priority_response.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'stockiest_priority_api_service.g.dart';

/// This class [StockiestPriorityApiService] is responsible
/// to include api calls related to the stockiest_priority feature
/// @RestApi is annotation which generate a g.dart file which contain implementation
/// of all abstract methods
@RestApi()
abstract class StockiestPriorityApiService {
  factory StockiestPriorityApiService(Dio dio) = _StockiestPriorityApiService;

  @GET(StockiestPriorityEndpoints.pathNonMappedStoreStatus)
  Future<HttpResponse<List<DistributorStoreEntity>>> getNonMappedStoreStatus({
    @Query(StockiestPriorityOptions.paramRetailerId) required String retailerId,
    @Query(StockiestPriorityOptions.paramUserId) required String userId,
  });

  @GET(StockiestPriorityEndpoints.saveDistributorPriorities)
  Future<HttpResponse<SaveDistributorPriorityResponse>>
      saveDistributorPriorities(
    @Query(StockiestPriorityOptions.userId) int userId,
    @Query(StockiestPriorityOptions.storePriorityText) String storePriorityText,
    @Query(StockiestPriorityOptions.fieldSep) String fieldSep,
    @Query(StockiestPriorityOptions.recordSep) String recordSep,
  );

  @POST(StockiestPriorityEndpoints.pathStoreMappingRequest)
  Future<HttpResponse<List<StoreStatusMappingRequestEntity>>>
      requestStoreMapping(
    @Body() Map<String, dynamic> request,
  );

  @GET(StockiestPriorityEndpoints.stockiestDistributors)
  Future<HttpResponse<StockiestPriorityResponseModel>>
      getStockiestDistributors({
    @Query(StockiestPriorityOptions.userId) required int userId,
  });

  @GET(StockiestPriorityEndpoints.orderDistributorList)
  Future<HttpResponse<List<StockiestResponseEntity>>> getOrderDistributors();
}
