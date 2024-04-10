
import 'package:flutter/material.dart';

import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/device_detector_widget.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/otp_screen/otp_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/otp_auth/otp_mobile_view.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/otp_auth/otp_web_view.dart';

class OtpScreen extends BasePage<LoginScreenState> {
  const OtpScreen({super.key});

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends BaseStatefulPage {
  late OtpScreenCubit _otpScreenCubit;

  void unregisterDI() {
    if (onboardingDI.isRegistered<OtpScreenCubit>()) {
      onboardingDI.unregister<OtpScreenCubit>();
    }
    if (onboardingDI.isRegistered<OtpFieldCubit>()) {
      onboardingDI.unregister<OtpFieldCubit>();
    }
    if (onboardingDI.isRegistered<ResendButtonCubit>()) {
      onboardingDI.unregister<ResendButtonCubit>();
    }
  }

  @override
  void initState() {
    unregisterDI();
    initOtpDependency();
    _otpScreenCubit = onboardingDI<OtpScreenCubit>();
    _otpScreenCubit.resendButtonCubit.startTimer();
    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    return DeviceDetectorWidget(
      webSiteView: () => OtpScreenWebView(
        otpScreenCubit: _otpScreenCubit,
      ),
      phoneView: () => OtpScreenMobileView(
        otpScreenCubit: _otpScreenCubit,
      ),
    );
  }

  @override
  void dispose() {
    _otpScreenCubit.resendButtonCubit.stopTimer();
    unregisterDI();
    super.dispose();
  }
}
