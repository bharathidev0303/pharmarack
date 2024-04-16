import 'package:equatable/equatable.dart';

class SearchBarState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchBarInitState extends SearchBarState {}

class StartDistributorSearch extends SearchBarState {
  final bool isStarted;

  StartDistributorSearch({this.isStarted = false});

  @override
  List<Object?> get props => [isStarted];
}

class StartProductSearch extends SearchBarState {
  final bool isStarted;

  StartProductSearch({this.isStarted = false});
}

class QueryForDropDownState extends SearchBarState {
  final String query;

  QueryForDropDownState({required this.query});
}

class DistributorSelectedState extends SearchBarState {
  final bool distributorSelected;

  DistributorSelectedState({required this.distributorSelected});

  @override
  List<Object?> get props => [distributorSelected];
}

class ResetState extends SearchBarState {
  final bool isDistributorActive;
  final bool isProductActive;
  final bool isItemSelected;

  ResetState(
      {this.isDistributorActive = false,
      this.isProductActive = false,
      this.isItemSelected = false});
}
