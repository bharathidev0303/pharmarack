import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/flymilestone/mile_stone_entity.dart';

abstract class MileStoneState extends Equatable {
  const MileStoneState();

  factory MileStoneState.initial() {
    return MileStoneInitialState();
  }

  @override
  List<Object?> get props => [];
}

class MileStoneInitialState extends MileStoneState {}

class MileStoneLoadingState extends MileStoneState {}

class MileStoneErrorState extends MileStoneState {}

class MileStoneDataState extends MileStoneState {
  final List<MileStoneOffers?> mileStoneModel;

  const MileStoneDataState({required this.mileStoneModel});

  @override
  List<Object?> get props => [
        mileStoneModel,
      ];
}
