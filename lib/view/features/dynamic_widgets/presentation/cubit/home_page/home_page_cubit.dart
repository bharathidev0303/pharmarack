import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/dynamic_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/home_page/home_page_state.dart';

/// This class [HomePageCubit] is consume by the [HomePagePage]
/// where all state will observed by [HomePagePage]
class HomePageCubit extends Cubit<HomePageState> {
  final DynamicWidgetsUseCase _homePageUseCase;

  HomePageCubit(super.initialState, this._homePageUseCase);

  void fetchHomePage() async {
    emit(HomePageLoadingState());
    final value = await _homePageUseCase.executeHomePage();
    value.fold((l) {
      emit(HomePageErrorState());
    }, (r) {
      emit(HomePageDataState(homePageModel: r));
    });
  }
}
