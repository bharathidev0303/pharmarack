import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_app_bar_state.dart';

class CustomAppBarCubit extends Cubit<CustomAppBarState> {
  CustomAppBarCubit() : super(const CustomAppBarState());

  distributorTextFieldTapped({required bool isTapped}) {
    emit(StartDistributorSearch(isStarted: isTapped));
  }

  distributorSelected({required bool isSelected}) {
    emit(DistributorSelectedState(distributorSelected: isSelected));
  }

  dropDownArrowTapped({required bool isTapped}) {
    emit(DropDownArrowTapped(isTapped: isTapped));
  }

  productTextFieldTapped({required bool isTapped}) {
    emit(StartProductSearch(isStarted: isTapped));
  }

  queryForDropDown(String query) {
    emit(QueryForDropDownState(query: query));
  }

  resetAppBar() {
    emit(const ResetState());
  }

  refreshAppBar({required bool refresh}) {
    emit(CustomAppBarRefreshState(refresh: refresh));
  }

  closeDistributorDropdown() {
    emit(const CloseDistributorDropdownState());
  }
}
