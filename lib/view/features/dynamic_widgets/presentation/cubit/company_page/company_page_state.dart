import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';

abstract class CompanyPageState extends Equatable {
  const CompanyPageState();

  factory CompanyPageState.initial() {
    return CompanyPageInitialState();
  }

  @override
  List<Object?> get props => [];
}

class CompanyPageInitialState extends CompanyPageState {}

class CompanyPageLoadingState extends CompanyPageState {}

class CompanyPageErrorState extends CompanyPageState {}

class CompanyPageDataState extends CompanyPageState {
  final DynamicWidgetModel companyPageModel;

  const CompanyPageDataState({required this.companyPageModel});

  @override
  List<Object?> get props => [
        companyPageModel,
      ];
}
