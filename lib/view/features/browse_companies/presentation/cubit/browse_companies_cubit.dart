import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';
import 'package:pharmarack/view/features/browse_companies/domain/use_case/browse_companies_use_case.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/cubit/browse_companies_state.dart';

/// This class [BrowseCompaniesCubit] is consume by the [BrowseCompaniesPage]
/// where all state will observed by [BrowseCompaniesPage]
final List<CompaniesModel> _companies = [];

class BrowseCompaniesCubit extends Cubit<BrowseCompaniesState> {
  final BrowseCompaniesUseCase _browseCompaniesUseCase;

  BrowseCompaniesCubit(this._browseCompaniesUseCase)
      : super(BrowseCompaniesState.initial());

  void fetchCompanies({required int page, required String limit}) async {
    emit(state.copyWith(browseCompanyMessage: BrowseCompanyLoading()));
    final value = await _browseCompaniesUseCase.execute(
        page: page.toString(), limit: limit);
    value.fold((l) {
      emit(state.copyWith(
          browseCompanyMessage: BrowseCompanyFailure(l.error.message)));
    }, (r) {
      if (_companies.length > 0) {
        _companies.clear();
      }
      _browseCompaniesUseCase.updateCompanies(r);
      _companies.addAll(r);
      emit(state.copyWith(
          companies: r, browseCompanyMessage: BrowseCompanySuccess()));
    });
  }

  void updateCompaniesPage({required int page, required String limit}) async {
    final value = await _browseCompaniesUseCase.execute(
        page: page.toString(), limit: limit);
    value.fold((l) {}, (r) {
      int companyLength = r.length;
      _companies.addAll(r);
      _browseCompaniesUseCase.updateCompanies(_companies);
      r.clear();
      r.addAll(_companies);
      if (companyLength < int.parse(limit)) {
        emit(state.copyWith(
            companies: r, browseCompanyMessage: CompanyListLimitReached()));
      } else {
        emit(state.copyWith(
            companies: r, browseCompanyMessage: BrowseCompanySuccess()));
      }
    });
  }

  void searchCompanies(String searchQuery) {
    final result = _browseCompaniesUseCase.searchCompanies(searchQuery);
    emit(
      state.copyWith(
        companies: result,
        browseCompanyMessage: BrowseCompanySuccess(),
      ),
    );
  }

  void filterCompanies(List<String> therapies, String query) {
    emit(
      state.copyWith(
        browseCompanyMessage: BrowseCompanySuccess(),
        therapies: therapies,
      ),
    );
    final result =
        _browseCompaniesUseCase.filterCompanies(state.therapies, query);
    emit(
      state.copyWith(
        companies: result,
        browseCompanyMessage: BrowseCompanySuccess(),
        therapies: state.therapies,
      ),
    );
  }

  void removeFilter(String therapy, String query) {
    final value = state.therapies;
    value.remove(therapy);
    emit(
      state.copyWith(
        therapies: [...value],
        browseCompanyMessage: BrowseCompanySuccess(
          uniqueId: UniqueKey().toString(),
        ),
      ),
    );
    filterCompanies(state.therapies, query);
  }
}
