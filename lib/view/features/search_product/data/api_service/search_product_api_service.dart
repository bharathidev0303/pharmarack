import 'package:dio/dio.dart' hide Headers;
import 'package:pharmarack/view/features/search_product/data/endpoints_constants/search_product_endpoints.dart';
import 'package:pharmarack/view/features/search_product/data/entity/search_product_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'search_product_api_service.g.dart';

/// This class [SearchProductApiService] is responsible
/// to include api calls related to the search_product feature
/// @RestApi is annotation which generate a g.dart file which contain implementation
/// of all abstract methods
@RestApi()
abstract class SearchProductApiService {
  factory SearchProductApiService(Dio dio) = _SearchProductApiService;

  @POST(SearchProductEndpoints.elasticSearchProduct)
  Future<HttpResponse<SearchProductEntity>> fetchProductFromElastic(
      @Body() Map<String, dynamic> requestBody,
      @Header('Authorization') String token);
}
