import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/view/features/distributor_connection/domain/model/new_distributor_details.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/cubit/distributor_connection_add_tab_state.dart';

import '../../domain/usecase/add_distributor_usecase.dart';

class DistributorConnectionAddTabCubit
    extends Cubit<DistributorConnectionAddTabState> {
  final AddDistributorUseCase _addDistributorUseCase;

  DistributorConnectionAddTabCubit(
    this._addDistributorUseCase,
  ) : super(DistributorConnectionAddTabState.initial());

  void submit({required String name, required String contactNumber}) {
    emit(state.copyWith(userMessage: None()));

    if (name.isEmpty) {
      emit(state.copyWith(userMessage: InvalidDistributorName()));
      return;
    }
    if (contactNumber.length < 10) {
      emit(state.copyWith(userMessage: InvalidContactNumber()));
      return;
    }
    if (contactNumber.startsWith(RegExp(r'^[0-4]'))) {
      emit(state.copyWith(userMessage: InvalidMobileNumberFormat()));
      return;
    }
    emit(state.copyWith(isLoading: true));
    _addDistributorUseCase
        .execute(
          NewDistributorDetails(name: name, contactNumber: contactNumber),
        )
        .then((_) => emit(state.copyWith(userMessage: AddDistributorSuccess())))
        .catchError((e, stack) => _onErrorAddDistributor(e, stack))
        .whenComplete(() => emit(state.copyWith(isLoading: false)));
  }

  _onErrorAddDistributor(Object e, StackTrace stack) {
    LogUtil.error(
      'Error while adding distributor',
      error: e,
      stackTrace: stack,
    );
    emit(state.copyWith(userMessage: AddDistributorFailure()));
  }

  void invalidMobileNumberFormat() {
    emit(state.copyWith(userMessage: InvalidMobileNumberFormat()));
  }
}
