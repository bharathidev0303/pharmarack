import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/dynamic_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/dynamic_widgets/dynamic_widgets_state.dart';

/// This class [DynamicWidgetsCubit] is consume by the [DynamicWidgetsPage]
/// where all state will observed by [DynamicWidgetsPage]
class DynamicWidgetsCubit extends Cubit<DynamicWidgetState> {
  final DynamicWidgetsUseCase _dynamicWidgetsUseCase;

  DynamicWidgetsCubit(super.initialState, this._dynamicWidgetsUseCase);

  void fetchHomePage() async {
    emit(DynamicWidgetLoadingState());
    final value = await _dynamicWidgetsUseCase.executeHomePage();
    value.fold((l) {
      emit(DynamicWidgetErrorState());
    }, (r) {
      emit(DynamicWidgetDataState(dynamicWidgetModel: r));
    });
  }

  void fetchDistributorPage({required String sId}) async {
    emit(DynamicWidgetLoadingState());
    final value = await _dynamicWidgetsUseCase.executeDistributorPage(sId: sId);
    value.fold((l) {
      emit(DynamicWidgetErrorState());
    }, (r) {
      emit(DynamicWidgetDataState(dynamicWidgetModel: r));
    });
  }

  void fetchCompanyPage({required String cId}) async {
    emit(DynamicWidgetLoadingState());
    final value = await _dynamicWidgetsUseCase.executeCompanyPage(cId: cId);
    value.fold((l) {
      emit(DynamicWidgetErrorState());
    }, (r) {
      emit(DynamicWidgetDataState(dynamicWidgetModel: r));
    });
  }

  void fetchNullSearchPage() async {
    emit(DynamicWidgetLoadingState());
    final value = await _dynamicWidgetsUseCase.executeNullSearchPage();
    value.fold((l) {
      emit(DynamicWidgetErrorState());
    }, (r) {
      emit(DynamicWidgetDataState(dynamicWidgetModel: r));
    });
  }
}
