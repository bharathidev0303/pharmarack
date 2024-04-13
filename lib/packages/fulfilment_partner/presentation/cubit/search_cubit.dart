import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<String> {
  SearchCubit(super.initialState);

  void updateSearchQuery(String searchQuery) {
    emit(searchQuery);
  }

  void clear() {
    emit("");
  }
}
