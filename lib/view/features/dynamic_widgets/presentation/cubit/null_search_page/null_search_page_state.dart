import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';

abstract class NullSearchPageState extends Equatable {
  const NullSearchPageState();

  factory NullSearchPageState.initial() {
    return NullSearchPageInitialState();
  }

  @override
  List<Object?> get props => [];
}

class NullSearchPageInitialState extends NullSearchPageState {}

class NullSearchPageLoadingState extends NullSearchPageState {}

class NullSearchPageErrorState extends NullSearchPageState {}

class NullSearchPageDataState extends NullSearchPageState {
  final DynamicWidgetModel nullSearchPageModel;

  const NullSearchPageDataState({required this.nullSearchPageModel});

  @override
  List<Object?> get props => [
        nullSearchPageModel,
      ];
}
