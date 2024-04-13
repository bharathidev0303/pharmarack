import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopBrandsList.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopDistributorsList.dart';

abstract class TopWidgetsViewMoreState extends Equatable {
  const TopWidgetsViewMoreState();

  factory TopWidgetsViewMoreState.initial() {
    return TopWidgetsViewMoreInitialState();
  }

  @override
  List<Object?> get props => [];
}

class TopWidgetsViewMoreInitialState extends TopWidgetsViewMoreState {}

class TopWidgetsViewMoreLoadingState extends TopWidgetsViewMoreState {}

class TopWidgetsViewMoreErrorState extends TopWidgetsViewMoreState {}

class TopWidgetsBrandsDataState extends TopWidgetsViewMoreState {
  final List<TopBrandsLists> brands;
  const TopWidgetsBrandsDataState({required this.brands});

  @override
  List<Object?> get props => [
        brands,
      ];
}

class TopWidgetsDistributorsDataState extends TopWidgetsViewMoreState {
  final List<TopDistributorsList> distributors;

  const TopWidgetsDistributorsDataState({required this.distributors});

  @override
  List<Object?> get props => [
        distributors,
      ];
}

// class TopWidgetsProductsDataState extends TopWidgetsViewMoreState {
//   final List<BrandsItems> products;

//   const TopWidgetsProductsDataState({required this.products});

//   @override
//   List<Object?> get props => [
//         products,
//       ];
// }
