import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/dynamic_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/distributors_page/distributors_page_state.dart';

/// This class [DistributorsPageCubit] is consume by the [DistributorsPagePage]
/// where all state will observed by [DistributorsPagePage]
class DistributorsPageCubit extends Cubit<DistributorsPageState> {
  final DynamicWidgetsUseCase _distributorsPageUseCase;

  DistributorsPageCubit(super.initialState, this._distributorsPageUseCase);

  void fetchDistributorPage({required String sId}) async {
    emit(DistributorsPageLoadingState());
    final value =
        await _distributorsPageUseCase.executeDistributorPage(sId: sId);
    value.fold((l) {
      emit(DistributorsPageErrorState());
    }, (r) {
      emit(DistributorsPageDataState(distributorsPageModel: r));
    });
  }
}
