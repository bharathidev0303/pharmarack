import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/dynamic_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/rewards_page/rewards_page_state.dart';

/// This class [RewardsPageCubit] is consume by the [RewardsPagePage]
/// where all state will observed by [RewardsPagePage]
class RewardsPageCubit extends Cubit<RewardsPageState> {
  final DynamicWidgetsUseCase _RewardsPageUseCase;

  RewardsPageCubit(super.initialState, this._RewardsPageUseCase);

  void fetchRewardsPage() async {
    emit(RewardsPageLoadingState());
    final value = await _RewardsPageUseCase.executeRewardsPage();
    value.fold((l) {
      emit(RewardsPageErrorState());
    }, (r) {
      emit(RewardsPageDataState(rewardsPageModel: r));
    });
  }
}
