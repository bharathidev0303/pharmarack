import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/BannerProductsList.dart';

abstract class BannerProductsListState extends Equatable {
  const BannerProductsListState();

  factory BannerProductsListState.initial() {
    return BannerProductsListInitialState();
  }

  @override
  List<Object?> get props => [];
}

class BannerProductsListInitialState extends BannerProductsListState {}

class BannerProductsListLoadingState extends BannerProductsListState {}

class BannerProductsListErrorState extends BannerProductsListState {}

class BannerProductsListDataState extends BannerProductsListState {
  final List<BannerProductsList> bannerProductsList;

  const BannerProductsListDataState({required this.bannerProductsList});

  @override
  List<Object?> get props => [
        bannerProductsList,
      ];
}
