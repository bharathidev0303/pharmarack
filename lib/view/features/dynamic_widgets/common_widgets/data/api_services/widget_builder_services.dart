import 'package:dio/dio.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/endpoints_constants/widget_builder_endpoints.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/endpoints_constants/widget_builder_options.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/distributors/distributors_entity.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/feedback/feedback_entity.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/products/products_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'widget_builder_services.g.dart';

@RestApi()
abstract class WidgetBuilderApiService {
  factory WidgetBuilderApiService(Dio dio) = _WidgetBuilderApiService;

  @GET(WidgetBuilderEndpoints.feedback)
  Future<HttpResponse<FeedbackEntity>> fetchFeedbackDetails(
      {@Query(WidgetBuilderOptions.page) required int page,
      @Query(WidgetBuilderOptions.limit) required int limit});

  @GET(ProductsEndpoints.topPicks)
  Future<HttpResponse<ProductsEntity>> fetchTopPicksDetails(
      {@Query(WidgetBuilderOptions.limit) required int limit});

  @GET(ProductsEndpoints.popularNearYou)
  Future<HttpResponse<ProductsEntity>> fetchPopularNearYouDetails(
      {@Query(WidgetBuilderOptions.limit) required int limit});

  @GET(ProductsEndpoints.recentlyOrdered)
  Future<HttpResponse<ProductsEntity>> fetchRecentlyOrderedDetails(
      {@Query(WidgetBuilderOptions.limit) required int limit});

  @GET(ProductsEndpoints.frequentlySearches)
  Future<HttpResponse<ProductsEntity>> fetchFrequentlySearchesDetails(
      {@Query(WidgetBuilderOptions.limit) required int limit});

  @GET(ProductsEndpoints.topOffers)
  Future<HttpResponse<ProductsEntity>> fetchTopOffersDetails(
      {@Query(WidgetBuilderOptions.limit) required int limit});

  @GET(DistributorsEndpoints.yourDistributors)
  Future<HttpResponse<DistributorsEntity>> fetchYourDistributorsDetails();

  @GET(DistributorsEndpoints.preferredDistributors)
  Future<HttpResponse<DistributorsEntity>> fetchPreferredDistributorsDetails(
      {@Query(WidgetBuilderOptions.orderBy) required String orderBy});
}
