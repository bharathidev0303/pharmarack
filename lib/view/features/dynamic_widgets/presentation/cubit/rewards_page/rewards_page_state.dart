import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';

abstract class RewardsPageState extends Equatable {
  const RewardsPageState();

  factory RewardsPageState.initial() {
    return RewardsPageInitialState();
  }

  @override
  List<Object?> get props => [];
}

class RewardsPageInitialState extends RewardsPageState {}

class RewardsPageLoadingState extends RewardsPageState {}

class RewardsPageErrorState extends RewardsPageState {}

class RewardsPageDataState extends RewardsPageState {
  final DynamicWidgetModel rewardsPageModel;

  const RewardsPageDataState({required this.rewardsPageModel});

  @override
  List<Object?> get props => [
        rewardsPageModel,
      ];
}
