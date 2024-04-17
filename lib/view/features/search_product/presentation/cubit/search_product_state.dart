import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import '../../data/entity/molecule_and_company_model.dart';

/// This class [SearchProductState] which should be consume by Cubit as it's state
class SearchProductState extends Equatable {
  @override
  List<Object?> get props => [];

  const SearchProductState();
}

class SearchProductInitialState extends SearchProductState {}

class SearchProductLoadingState extends SearchProductState {}

class SearchProductErrorState extends SearchProductState {}

class CompanyFiltersDataState extends SearchProductState {
  final MoleculeAndCompanyModel moleculeAndCompanyModel;

  const CompanyFiltersDataState(this.moleculeAndCompanyModel);
}

class CompanyFiltersErrorState extends SearchProductState {}

class SearchProductDataState extends SearchProductState {
  final SearchProductModel searchProductModel;
  const SearchProductDataState(this.searchProductModel);

  @override
  List<Object?> get props => [searchProductModel];
}

class SearchProductFilteredDataState extends SearchProductState {
  final List<SearchProductListModel>? mappedList;
  final List<SearchProductListModel>? unMappedList;

  const SearchProductFilteredDataState(this.mappedList, this.unMappedList);

  @override
  List<Object?> get props => [mappedList, unMappedList];
}

class SearchProductDataEmptyListState extends SearchProductState {}

class DistributorsEmptyState extends SearchProductState {}

class SearchProductErrorMessageState extends SearchProductState {
  final String errorMessage;
  const SearchProductErrorMessageState(this.errorMessage);
}

class SearchProductBlurState extends SearchProductState {
  final bool isBlur;
  const SearchProductBlurState({required this.isBlur});

  @override
  List<Object?> get props => [isBlur];
}

class ShowDistributorPageState extends SearchProductState {
  final String distributorName;
  final int id;
  const ShowDistributorPageState(this.distributorName, this.id);
  @override
  List<Object?> get props => [distributorName, id];
}

class ShowCompanyPageState extends SearchProductState {
  final String companyName;
  final int comapanyId;
  const ShowCompanyPageState(this.companyName, this.comapanyId);
  @override
  List<Object?> get props => [companyName, comapanyId];
}

class ShowDistributorsLockedPageState extends SearchProductState {
  final int isPartyLocked;
  final int isPartyLockedByDist;
  const ShowDistributorsLockedPageState(
      this.isPartyLocked, this.isPartyLockedByDist);
}
