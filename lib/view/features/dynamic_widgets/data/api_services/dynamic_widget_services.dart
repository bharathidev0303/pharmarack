import 'package:dio/dio.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/endpoints_constants/dynamic_widget/dynamic_widget_endpoints.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/endpoints_constants/dynamic_widget/dynamic_widget_options.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/dynamic_widget_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'dynamic_widget_services.g.dart';

@RestApi()
abstract class DynamicWidgetApiService {
  factory DynamicWidgetApiService(Dio dio) = _DynamicWidgetApiService;

  @GET(DynamicWidgetEndpoints.homepage)
  Future<HttpResponse<DynamicWidgetEntity>> fetchHomePageDetails(
      @Query(DynamicWidgetOptions.rId) String rId);

  @GET(DynamicWidgetEndpoints.companyPage)
  Future<HttpResponse<DynamicWidgetEntity>> fetchCompanyPageDetails({
    @Query(DynamicWidgetOptions.rId) required String rId,
    @Query(DynamicWidgetOptions.cId) required String cId,
  });

  @GET(DynamicWidgetEndpoints.distributorPage)
  Future<HttpResponse<DynamicWidgetEntity>> fetchDistributorPageDetails({
    @Query(DynamicWidgetOptions.rId) required String rId,
    @Query(DynamicWidgetOptions.sId) required String sId,
  });

  @GET(DynamicWidgetEndpoints.nullSearchPage)
  Future<HttpResponse<DynamicWidgetEntity>> fetchNullSearchPageDetails(
      @Query(DynamicWidgetOptions.rId) String rId);

  @GET(DynamicWidgetEndpoints.rewardsPage)
  Future<HttpResponse<DynamicWidgetEntity>> fetchRewardsPageDetails(
      @Query(DynamicWidgetOptions.rId) String rId);
}
