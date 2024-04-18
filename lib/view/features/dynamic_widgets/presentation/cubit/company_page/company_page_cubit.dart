import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/dynamic_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/company_page/company_page_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/company_page/company_screen_page_mobile_view.dart';

/// This class [CompanyPageCubit] is consume by the [CompanyPagePage]
/// where all state will observed by [CompanyPagePage]
class CompanyPageCubit extends Cubit<CompanyPageState> {
  final DynamicWidgetsUseCase _companyPageUseCase;

  CompanyPageCubit(super.initialState, this._companyPageUseCase);

  void fetchCompanyPage(
      {required String cId, required String companyName}) async {
    emit(CompanyPageLoadingState());
    final value = await _companyPageUseCase.executeCompanyPage(cId: cId);
    value.fold((l) {
      emit(CompanyPageErrorState());
    }, (r) {
      r.widget.insert(0, companyPageTittle(companyName));
      emit(CompanyPageDataState(companyPageModel: r));
    });
  }
}
