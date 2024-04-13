import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';
import 'package:pharmarack/view/features/browse_companies/domain/repository/browse_companies_repository.dart';

/// This class [BrowseCompaniesUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class BrowseCompaniesUseCase {
  final BrowseCompaniesRepository _browseCompaniesRepository;
  final List<CompaniesModel> _companies;

  BrowseCompaniesUseCase(this._browseCompaniesRepository, this._companies);

  Future<Either<BaseError, List<CompaniesModel>>> execute(
      {required String page, required String limit}) {
    return _browseCompaniesRepository.getCompanies(page: page, limit: limit);
  }

  void updateCompanies(List<CompaniesModel> companies) {
    _companies.clear();
    _companies.addAll(companies);
  }

  List<CompaniesModel> searchCompanies(String query) {
    final lowercase = query.toLowerCase();
    return lowercase.isEmpty
        ? _companies
        : _companies
            .filter((t) =>
                t.companyName?.toLowerCase().contains(lowercase) ?? false)
            .toList();
  }

  List<CompaniesModel> filterCompanies(List<String> therapies, String query) {
    final results = searchCompanies(query);

    return therapies.isNotEmpty
        ? results
            .filter((e) =>
                therapies.any((e2) => (e.therapy?.contains(e2) ?? false)) ||
                therapies.contains("All"))
            .toList()
        : results;
  }
}
