import 'package:dio/dio.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/common_response_entity.dart';
import 'package:pharmarack/view/features/change_distributor/change_distributor_constants.dart';
import 'package:pharmarack/view/features/change_distributor/data/product_distributors_response_entity.dart';
import 'package:retrofit/http.dart';

part 'change_distributor_api_service.g.dart';

@RestApi()
abstract class ChangeDistributorsApiService {
  factory ChangeDistributorsApiService(Dio dio) = _ChangeDistributorsApiService;

  @GET(ChangeDistributorConstants.pathGetDistributorListByProductId)
  Future<CommonResponseEntity<ProductDistributorsResponseEntity>>
      fetchProductDistributors(
    @Query('productId') int productId,
    @Query('pageNo') int pageNo,
  );
}
