import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';

abstract class DistributorsPageState extends Equatable {
  const DistributorsPageState();

  factory DistributorsPageState.initial() {
    return DistributorsPageInitialState();
  }

  @override
  List<Object?> get props => [];
}

class DistributorsPageInitialState extends DistributorsPageState {}

class DistributorsPageLoadingState extends DistributorsPageState {}

class DistributorsPageErrorState extends DistributorsPageState {}

class DistributorsPageDataState extends DistributorsPageState {
  final DynamicWidgetModel distributorsPageModel;

  const DistributorsPageDataState({required this.distributorsPageModel});

  @override
  List<Object?> get props => [
        distributorsPageModel,
      ];
}
