import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/dynamic_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/null_search_page/null_search_page_state.dart';

/// This class [NullSearchPageCubit] is consume by the [NullSearchPagePage]
/// where all state will observed by [NullSearchPagePage]
class NullSearchPageCubit extends Cubit<NullSearchPageState> {
  final DynamicWidgetsUseCase _nullSearchPageUseCase;

  NullSearchPageCubit(super.initialState, this._nullSearchPageUseCase);

  void fetchNullSearchPage() async {
    emit(NullSearchPageLoadingState());
    final value = await _nullSearchPageUseCase.executeNullSearchPage();
    value.fold((l) {
      emit(NullSearchPageErrorState());
    }, (r) {
      emit(NullSearchPageDataState(nullSearchPageModel: r));
    });
  }
}
