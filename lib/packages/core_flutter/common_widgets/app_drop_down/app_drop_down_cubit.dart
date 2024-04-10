import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDropDownCubit extends Cubit<AppDropDownState> {
  AppDropDownCubit() : super(AppDropDownInitState());

  openDropDown(bool isOpen) {
    emit(AppDropDownOpenState(isOpen: isOpen));
  }

  dropDownItemSelected(String selectedItem) {
    emit(AppDropDownSelectedState(selectedItem));
  }
}

class AppDropDownState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppDropDownInitState extends AppDropDownState {}

class AppDropDownOpenState extends AppDropDownState {
  final bool isOpen;
  AppDropDownOpenState({this.isOpen = false});
  @override
  List<Object?> get props => [isOpen];
}

class AppDropDownSelectedState extends AppDropDownState {
  final String selectedDistributor;
  AppDropDownSelectedState(this.selectedDistributor);
  @override
  List<Object?> get props => [selectedDistributor];
}
