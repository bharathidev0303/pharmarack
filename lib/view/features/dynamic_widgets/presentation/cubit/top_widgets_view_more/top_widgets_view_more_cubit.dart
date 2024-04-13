import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/top_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/top_widgets_view_more/top_widgets_view_more_state.dart';

/// This class [TopWidgetsViewMoreCubit] is consume by the [TopWidgetsViewMorePage]
/// where all state will observed by [TopWidgetsViewMorePage]
class TopWidgetsViewMoreCubit extends Cubit<TopWidgetsViewMoreState> {
  final TopWidgetsViewMoreUseCase _topWidgetsViewMoreUseCase;

  TopWidgetsViewMoreCubit(super.initialState, this._topWidgetsViewMoreUseCase);

  void fetchBrands({required int page, required int limit}) async {
    if (page == 1) {
      emit(TopWidgetsViewMoreLoadingState());
    }
    final value = await _topWidgetsViewMoreUseCase.executeBrands(
        page: page, limit: limit);
    value.fold((l) {
      emit(TopWidgetsViewMoreErrorState());
    }, (r) {
      emit(TopWidgetsBrandsDataState(brands: r));
    });
  }

  void fetchDistributors({required int page, required int limit}) async {
    emit(TopWidgetsViewMoreLoadingState());
    final value = await _topWidgetsViewMoreUseCase.executeDistributors(
        page: page, limit: limit);
    value.fold((l) {
      emit(TopWidgetsViewMoreErrorState());
    }, (r) {
      emit(TopWidgetsDistributorsDataState(distributors: r));
    });
  }
}
