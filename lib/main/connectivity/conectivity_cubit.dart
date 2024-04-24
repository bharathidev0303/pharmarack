import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<int> {
  ConnectivityCubit(super.initialState);

  void updateBottomNavigationIndex(int index) {
    emit(index);
  }

  int getBottomNavigationIndex() {
    return state;
  }
}
