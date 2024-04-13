import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';

abstract class DynamicWidgetState extends Equatable {
  const DynamicWidgetState();

  factory DynamicWidgetState.initial() {
    return DynamicWidgetInitialState();
  }

  @override
  List<Object?> get props => [];
}

class DynamicWidgetInitialState extends DynamicWidgetState {}

class DynamicWidgetLoadingState extends DynamicWidgetState {}

class DynamicWidgetErrorState extends DynamicWidgetState {}

class SaveUserInfoState extends DynamicWidgetState {
  final String info;

  const SaveUserInfoState({required this.info});

  @override
  List<Object?> get props => [info];
}

class DynamicWidgetDataState extends DynamicWidgetState {
  final DynamicWidgetModel dynamicWidgetModel;

  const DynamicWidgetDataState({required this.dynamicWidgetModel});

  @override
  List<Object?> get props => [
        dynamicWidgetModel,
      ];
}
