import 'package:dio/dio.dart';
import 'package:pharmarack/view/dashboard/order_history/data/endpoint_constants/display_orders_query_params.dart';
import 'package:pharmarack/view/dashboard/order_history/data/endpoint_constants/order_history_endpoint_constants.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/all_filter.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/display_order.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/display_order_detail.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/reorder_entity.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/reorder_use_case.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'order_history_api_service.g.dart';

@RestApi()
abstract class OrderHistoryApiService {
  factory OrderHistoryApiService(Dio dio) = _OrderHistoryApiService;

  @GET(OrderHistoryEndPointConstants.displayOrders)
  Future<HttpResponse<DisplayOrdersResponse>> getDisplayOrders(
    @Query(DisplayOrdersQueryParams.userId) String userId,
    @Query(DisplayOrdersQueryParams.storeId) int storeId,
    @Query(DisplayOrdersQueryParams.searchText) String searchText,
    @Query(DisplayOrdersQueryParams.fromDate) String fromDate,
    @Query(DisplayOrdersQueryParams.toDate) String toDate,
    @Query(DisplayOrdersQueryParams.status) String status,
    @Query(DisplayOrdersQueryParams.operation) String operation,
  );

  @GET(OrderHistoryEndPointConstants.displayOrderDetail)
  Future<HttpResponse<DisplayOrderDetail>> getOrderHistoryDetail(
    @Query(DisplayOrdersQueryParams.orderId) int orderId,
  );

  @POST(OrderHistoryEndPointConstants.retailerReorder)
  Future<HttpResponse<ReorderEntity>> reorder(
    @Path(OrderHistoryEndPointConstants.retailerReorder) String endpoint,
    @Body() List<ReorderParam> reorderBodies,
);

  @GET(OrderHistoryEndPointConstants.allFilterApi)
  Future<HttpResponse<AllFilter>> getAllFilter();
}
