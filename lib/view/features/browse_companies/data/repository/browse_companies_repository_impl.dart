import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/browse_companies/data/data_source/remote_data_source/browse_companies_remote_data_source.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';
import 'package:pharmarack/view/features/browse_companies/domain/repository/browse_companies_repository.dart';

/// This class [BrowseCompaniesRepositoryImpl] is the implementation of [BrowseCompaniesRepository]
class BrowseCompaniesRepositoryImpl implements BrowseCompaniesRepository {
  final BrowseCompaniesRemoteDataSource _browseCompaniesRemoteDataSource;

  BrowseCompaniesRepositoryImpl(this._browseCompaniesRemoteDataSource);

  @override
  Future<Either<BaseError, List<CompaniesModel>>> getCompanies(
      {required String page, required String limit}) {
    return _browseCompaniesRemoteDataSource.getCompanies(
        page: page, limit: limit);
  }
}
