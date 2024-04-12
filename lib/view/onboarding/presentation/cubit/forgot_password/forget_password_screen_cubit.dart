import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/model/forget_password_params.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_forget_password_uescase.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class ForgotPasswordScreenCubit extends Cubit<ForgotPasswordScreenState> {
  final RequestForgetPasswordUseCase _requestForgetPasswordUseCase;
  final MobileNumberFieldCubit mobileNumberFieldCubit;
  final mobileNumberFieldController = TextEditingController();

  ForgotPasswordScreenCubit(
      RequestForgetPasswordUseCase requestResetPasswordUseCase,
      this.mobileNumberFieldCubit)
      : _requestForgetPasswordUseCase = requestResetPasswordUseCase,
        super(ForgotPasswordScreenInitialState());

  Future<void> requestForgetPassword() async {
    emit(ForgotPasswordScreenLoadingState());
    final response = await _requestForgetPasswordUseCase.execute(
      params: RequestForgetPasswordParams(
        forgetPasswordParams: ForgetPasswordParams(
            mobileNumber: mobileNumberFieldController.text, email: ''),
      ),
    );
    response.fold(
        (l) => emit(
            ForgotPasswordScreenErrorState(statusMessage: l.error.message)),
        (r) {
      if (r.success == true) {
        if (onboardingDI.isRegistered<String>(
            instanceName: OnboardingConstants.mobileNumberDiConstant)) {
          onboardingDI.unregister<String>(
              instanceName: OnboardingConstants.mobileNumberDiConstant);
        }
        onboardingDI.registerSingleton<String>(mobileNumberFieldController.text,
            instanceName: OnboardingConstants.mobileNumberDiConstant);
        emit(const ForgotPasswordScreenDataState());
      } else {
        emit(ForgotPasswordScreenErrorState(statusMessage: r.message));
      }
    });
  }

  void validateMobileNumber(String mobileNumber) {
    if (state is ForgotPasswordScreenErrorState) {
      emit(ForgotPasswordScreenInitialState());
    }
    mobileNumberFieldCubit.validateMobileNumber(mobileNumber);
  }
}
