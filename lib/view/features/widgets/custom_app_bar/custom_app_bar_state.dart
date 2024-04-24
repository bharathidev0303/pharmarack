import 'package:equatable/equatable.dart';

class CustomAppBarState extends Equatable {
  @override
  List<Object?> get props => [];
  const CustomAppBarState();
}

class CustomAppBarInitState extends CustomAppBarState {
  const CustomAppBarInitState();
}

class StartDistributorSearch extends CustomAppBarState {
  final bool isStarted;
  const StartDistributorSearch({this.isStarted = false});
  @override
  List<Object?> get props => [isStarted];
}

class StartProductSearch extends CustomAppBarState {
  final bool isStarted;
  const StartProductSearch({this.isStarted = false});
}

class StartProductTyped extends CustomAppBarState {
  final bool isTyped;
  const StartProductTyped({this.isTyped = false});
}

class DropDownArrowTapped extends CustomAppBarState {
  final bool isTapped;
  const DropDownArrowTapped({this.isTapped = false});

  @override
  List<Object?> get props => [isTapped];
}

class QueryForDropDownState extends CustomAppBarState {
  final String query;
  const QueryForDropDownState({required this.query});
}

class DistributorSelectedState extends CustomAppBarState {
  final bool distributorSelected;
  const DistributorSelectedState({required this.distributorSelected});
  @override
  List<Object?> get props => [distributorSelected];
}

class ResetState extends CustomAppBarState {
  final bool isDistributorActive;
  final bool isProductActive;
  final bool isItemSelected;
  const ResetState(
      {this.isDistributorActive = false,
      this.isProductActive = false,
      this.isItemSelected = false});

  @override
  List<Object?> get props =>
      [isDistributorActive, isProductActive, isItemSelected];
}

class CloseDistributorDropdownState extends CustomAppBarState {
  const CloseDistributorDropdownState();
}

// class DistributorSelectedState extends CustomAppBarState {
//   const DistributorSelectedState();
//
// }
