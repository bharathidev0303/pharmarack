import 'package:dio/dio.dart' hide Headers;
import 'package:pharmarack/view/features/search_product/data/endpoints_constants/add_product_to_cart_options.dart';
import 'package:pharmarack/view/features/search_product/data/endpoints_constants/search_product_endpoints.dart';
import 'package:pharmarack/view/features/search_product/data/entity/add_product_to_cart_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'add_product_api_service.g.dart';

/// This class [AddProductApiService] is responsible
/// to include api calls related to the search_product feature
/// @RestApi is annotation which generate a g.dart file which contain implementation
/// of all abstract methods
@RestApi()
abstract class AddProductApiService {
  factory AddProductApiService(Dio dio) = _AddProductApiService;

  @GET(SearchProductEndpoints.addProductToCart)
  Future<HttpResponse<AddProductToCartEntity>> addProductToCartApi({
    @Query(AddProductToCartRequestParams.storeId) required int storeId,
    @Query(AddProductToCartRequestParams.quantity) required int quantity,
    @Query(AddProductToCartRequestParams.productCode)
    required String productCode,
    @Query(AddProductToCartRequestParams.ptr) required double ptr,
    @Query(AddProductToCartRequestParams.hiddenPTR) required double hiddenPTR,
    @Query(AddProductToCartRequestParams.gSTPercentage)
    required double gSTPercentage,
    @Query(AddProductToCartRequestParams.cartSource) required String cartSource,
    @Query(AddProductToCartRequestParams.isDODProductCheck)
    required int isDODProductCheck,
    @Query(AddProductToCartRequestParams.isDODPreferenceSet)
    required int isDODPreferenceSet,
    @Query(AddProductToCartRequestParams.isDODProductSelected)
    required int isDODProductSelected,
  });
}
