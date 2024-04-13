import 'package:dio/dio.dart';
import 'package:pharmarack/view/features/cart/data/endpoints_constants/cart_endpoints.dart';
import 'package:pharmarack/view/features/cart/data/endpoints_constants/cart_request_params.dart';
import 'package:pharmarack/view/features/cart/data/model/cart_detail.dart';
import 'package:pharmarack/view/features/search_product/data/endpoints_constants/add_product_to_cart_options.dart';
import 'package:retrofit/retrofit.dart';
import '../model/place_order_api_request.dart';

part 'cart_api_service.g.dart';

@RestApi()
abstract class CartApiService {
  factory CartApiService(Dio dio) = _CartApiService;

  @GET(CartEndPoints.cartDetails)
  Future<HttpResponse<CartDetailEntity>> getCartDetails();

  @GET(CartEndPoints.deleteProduct)
  Future<HttpResponse<CartDetailEntity>> deleteProduct({
    @Query(CartRequestParams.storeId) required String storeId,
    @Query(CartRequestParams.productCode) required String productCode,
  });

  @GET(CartEndPoints.addProductToCart)
  Future<HttpResponse<CartDetailEntity>> addProductToCartApi({
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

  @GET(CartEndPoints.getStoreDetailsAPI)
  Future<HttpResponse<CartDetailEntity>> getStoreDetails({
    @Query(CartRequestParams.storeId) required String storeId,
  });

  @PATCH(CartEndPoints.cancelOrder)
  Future<HttpResponse<String>> cancelOrder(
    @Body() Map<String, String> request,
  );

  @POST(CartEndPoints.savePlaceOrder)
  Future<HttpResponse<String>> placeOrder(
    @Body() List<PlaceOrderApiRequest> requestBody,
  );
}
