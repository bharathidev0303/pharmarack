import 'package:dio/dio.dart';
import 'package:pharmarack/view/features/browse_companies/data/endpoints_constants/browse_companies_endpoints.dart';
import 'package:pharmarack/view/features/browse_companies/data/endpoints_constants/browse_companies_options.dart';
import 'package:pharmarack/view/features/browse_companies/data/model/company_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'browse_companies_api_service.g.dart';

/// This class [BrowseCompaniesApiService] is responsible
/// to include api calls related to the browse_companies feature
/// @RestApi is annotation which generate a g.dart file which contain implementation
/// of all abstract methods
@RestApi()
abstract class BrowseCompaniesApiService {
  factory BrowseCompaniesApiService(Dio dio) = _BrowseCompaniesApiService;

  @GET(BrowseCompaniesEndpoints.fetchCompanies)
  Future<HttpResponse<CompanyEntity>> fetchCompanies({
    @Query(BrowseCompaniesOptions.page) required String page,
    @Query(BrowseCompaniesOptions.limit) required String limit,
  });
}
