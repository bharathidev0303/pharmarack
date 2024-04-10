import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/referral_t_and_c_state.dart';

import '../../domain/usecase/referral_terms_and_condition_usecase.dart';

class ReferralTAndCCubit extends Cubit<ReferralTAndCState> {
  final ReferralTermsAndConditionUsecase _referralTermsAndConditionUsecase;

  ReferralTAndCCubit(this._referralTermsAndConditionUsecase)
      : super(ReferralTAndCInitialState());

  // ReferralTAndCCubit({required this._referralTermsAndConditionUsecase}) : super(initialState);

  Future<void> doReferralTandC() async {
    final response = await _referralTermsAndConditionUsecase.execute(
        params: ReferralTermsAndConditionDataParams());
    response.fold((l) {
      emit(const ReferralTAndCErrorState(statusMessage: 'error'));
    }, (r) {
      if (r.isNotEmpty) {
        debugPrint('PR-> items: ${r[0]}');
        debugPrint('PR-> items: ${r[1]}');
        debugPrint('PR-> items: ${r[2]}');
      }
    });
  }
}
