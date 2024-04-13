import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/cubit/fly_milestone/milestone_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/repository/fly_repository.dart';

/// This class [MileStoneCubit] is consume by the [MileStonePage]
/// where all state will observed by [MileStonePage]
class MileStoneCubit extends Cubit<MileStoneState> {
  final FlyRepository _flyRepository;

  MileStoneCubit(super.initialState, this._flyRepository);

  void fetchMileStone() async {
    emit(MileStoneLoadingState());
    final value = await _flyRepository.fetchMilestoneList();
    value.fold((l) {
      emit(MileStoneErrorState());
    }, (r) {
      emit(MileStoneDataState(mileStoneModel: r.milestoneOffers!));
    });
  }
}
