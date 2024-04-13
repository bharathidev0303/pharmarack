import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';

/// This class [BrowseCompaniesState] which should be consume by Cubit as it's state
class BrowseCompaniesState extends Equatable {
  final List<CompaniesModel> companies;
  final List<String> therapies;
  final BrowseCompanyMessage browseCompanyMessage;

  const BrowseCompaniesState(
    this.companies,
    this.browseCompanyMessage,
    this.therapies,
  );

  factory BrowseCompaniesState.initial() {
    return BrowseCompaniesState(
      const [],
      BrowseCompanyNone(),
      const [],
    );
  }

  BrowseCompaniesState copyWith(
      {List<CompaniesModel>? companies,
      BrowseCompanyMessage? browseCompanyMessage,
      List<String>? therapies}) {
    return BrowseCompaniesState(
      companies ?? this.companies,
      browseCompanyMessage ?? this.browseCompanyMessage,
      therapies ?? this.therapies,
    );
  }

  @override
  List<Object?> get props => [
        companies,
        browseCompanyMessage,
        therapies,
      ];
}

sealed class BrowseCompanyMessage with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class BrowseCompanyNone extends BrowseCompanyMessage {}

class BrowseCompanySuccess extends BrowseCompanyMessage {
  final String? uniqueId;

  BrowseCompanySuccess({this.uniqueId});

  @override
  List<Object?> get props => [uniqueId];
}

class BrowseCompanyFailure extends BrowseCompanyMessage {
  final String errorMsg;

  BrowseCompanyFailure(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}

class BrowseCompanyLoading extends BrowseCompanyMessage {}

class CompanyListLimitReached extends BrowseCompanyMessage {}
