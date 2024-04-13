import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit(super.initialState);

  void updateBottomNavigationIndex(int index) {
    emit(index);
  }

  int getBottomNavigationIndex() {
    return state;
  }
}
