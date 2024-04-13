import 'package:dio/dio.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/endpoints_constants/banner_products_list/banner_products_list_endpoints.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/banner_products_list_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'banner_products_list_services.g.dart';

@RestApi()
abstract class BannerProductsListApiService {
  factory BannerProductsListApiService(Dio dio) = _BannerProductsListApiService;

  @POST(BannerProductsListEndpoints.getDisplayStoreProductsAcrossStoresNewPost)
  Future<HttpResponse<BannerProductsListEntity>>
      fetchProductsAcrossStoresNewPost(@Body() Map<String, dynamic> params);
}
