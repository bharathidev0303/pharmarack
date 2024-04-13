import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  factory HomePageState.initial() {
    return HomePageInitialState();
  }

  @override
  List<Object?> get props => [];
}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageErrorState extends HomePageState {}

class HomePageDataState extends HomePageState {
  final DynamicWidgetModel homePageModel;

  const HomePageDataState({required this.homePageModel});

  @override
  List<Object?> get props => [
        homePageModel,
      ];
}
