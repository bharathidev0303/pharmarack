import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarInitState());

  distributorTextFieldTapped({required bool isTapped}) {
    emit(StartDistributorSearch(isStarted: isTapped));
  }

  productTextFieldTapped({required bool isTapped}) {
    emit(StartProductSearch(isStarted: isTapped));
  }

  queryForDropDown(String query) {
    emit(QueryForDropDownState(query: query));
  }

  resetAppBar() {
    emit(ResetState());
  }
}
