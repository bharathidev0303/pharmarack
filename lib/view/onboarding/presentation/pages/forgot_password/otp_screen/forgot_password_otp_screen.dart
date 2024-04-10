
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/otp_screen/forget_password_otp_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/forgot_password/otp_screen/forgot_password_otp_screen_mobile_view.dart';

class ForgotPasswordOtpScreen extends BasePage<ForgotPasswordOtpScreenState> {
  const ForgotPasswordOtpScreen({super.key});

  @override
  ForgotPasswordOtpScreenState createState() {
    return ForgotPasswordOtpScreenState();
  }
}

class ForgotPasswordOtpScreenState extends BaseStatefulPage {
  late ForgotPasswordOtpScreenCubit _forgotPasswordOtpScreenCubit;

  @override
  void initState() {
    unregisterDI();
    initForgotPasswordOtpDependency();
    _forgotPasswordOtpScreenCubit =
        onboardingDI<ForgotPasswordOtpScreenCubit>();
    super.initState();
  }

  void unregisterDI() {
    if (onboardingDI.isRegistered<OtpFieldCubit>()) {
      onboardingDI.unregister<OtpFieldCubit>();
    }
    if (onboardingDI.isRegistered<ResendButtonCubit>()) {
      onboardingDI.unregister<ResendButtonCubit>();
    }
    if (onboardingDI.isRegistered<ForgotPasswordOtpScreenCubit>()) {
      onboardingDI.unregister<ForgotPasswordOtpScreenCubit>();
    }
    if (onboardingDI.isRegistered<StoreHeaderUseCase>()) {
      onboardingDI.unregister<StoreHeaderUseCase>();
    }
  }

  @override
  void dispose() {
    _forgotPasswordOtpScreenCubit.resendButtonCubit.stopTimer();
    unregisterDI();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    return ForgotPasswordOtpScreenMobileView(
      forgotPasswordOtpScreenCubit: _forgotPasswordOtpScreenCubit,
    );
  }
}
