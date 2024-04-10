import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/update_retailer_state.dart';


class UpdateRetailerProfileCubit extends Cubit<UpdateRetailerState> {
  UpdateRetailerProfileCubit(super.initialState);

  void doUpdateRetailerProfile() {}
  // final UpdateRetailerProfileUsecase _updateRetailerProfileUsecase;

  // UpdateRetailerProfileCubit(this._updateRetailerProfileUsecase)
  //     : super(UpdateRetailerInitialState());

  // Future<void> doUpdateRetailerProfile() async {
  //   final response = await _updateRetailerProfileUsecase.execute(
  //       params: UpdateRetailerUseCaseParams(
  //           _updateRetailerProfileUsecase.getRequestString()));

  //   response.fold(
  //       (l) => emit(const UpdateRetailerErrorState(statusMessage: 'error')),
  //       (r) {
  //     debugPrint('PR-> response data: $r}');
  //   });
  // }
}
