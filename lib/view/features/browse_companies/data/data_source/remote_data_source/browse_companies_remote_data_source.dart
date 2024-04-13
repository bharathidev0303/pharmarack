import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/browse_companies/data/api_service/browse_companies_api_service.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';

/// This class [BrowseCompaniesRemoteDataSource] is used to fetch Api from network
/// using [BrowseCompaniesApiService] class.
class BrowseCompaniesRemoteDataSource {
  final BrowseCompaniesApiService _browseCompaniesApiService;

  BrowseCompaniesRemoteDataSource(this._browseCompaniesApiService);

  Future<Either<BaseError, List<CompaniesModel>>> getCompanies(
      {required String page, required String limit}) async {
    final response = await safeApiCall(
        _browseCompaniesApiService.fetchCompanies(page: page, limit: limit));

    return response.fold((l) => left(l), (r) {
      final companies = r.data.companies!
          .map((e) => CompaniesModel.fromCompanies(e))
          .toList();
      return right(companies);
    });
  }
}
