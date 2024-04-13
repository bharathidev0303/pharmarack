import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';

/// This class [BrowseCompaniesRepository] is the blueprint of network api call
abstract class BrowseCompaniesRepository {
  Future<Either<BaseError, List<CompaniesModel>>> getCompanies(
      {required String page, required String limit});
}
