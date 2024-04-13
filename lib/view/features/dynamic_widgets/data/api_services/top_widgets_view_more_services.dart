import 'package:dio/dio.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/endpoints_constants/top_widgets_view_more/top_widgets_view_more_endpoints.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/endpoints_constants/top_widgets_view_more/top_widgets_view_more_options.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/top_widgets_view_more_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'top_widgets_view_more_services.g.dart';

@RestApi()
abstract class TopWidgetsViewMoreApiService {
  factory TopWidgetsViewMoreApiService(Dio dio) = _TopWidgetsViewMoreApiService;

  @GET(TopWidgetsViewMoreEndpoints.brandsList)
  Future<HttpResponse<TopWidgetsViewMoreEntity>> fetchBrandsDetails(
      {@Query(TopWidgetsViewMoreOptions.page) required int page,
      @Query(TopWidgetsViewMoreOptions.limit) int? limit});

  @GET(TopWidgetsViewMoreEndpoints.distributorList)
  Future<HttpResponse<TopWidgetsViewMoreEntity>> fetchDistributorsDetails(
      {@Query(TopWidgetsViewMoreOptions.retailerId) required int rId,
      @Query(TopWidgetsViewMoreOptions.page) required int page,
      @Query(TopWidgetsViewMoreOptions.limit) int? limit});
}
