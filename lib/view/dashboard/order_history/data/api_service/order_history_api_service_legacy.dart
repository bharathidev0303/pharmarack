import 'package:dio/dio.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/reorder_entity.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/reorder_use_case.dart';

import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'order_history_api_service_legacy.g.dart';

@RestApi()
abstract class OrderHistoryApiServiceLegacy {
  factory OrderHistoryApiServiceLegacy(Dio dio) = _OrderHistoryApiServiceLegacy;

  @POST("{endpoint}")
  Future<HttpResponse<ReorderEntity>> reorder(
    @Path("endpoint") String endpoint,
    @Body() List<ReorderParam> reorderBodies,
  );
}
