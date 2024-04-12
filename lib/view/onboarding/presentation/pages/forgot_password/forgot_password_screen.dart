import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/forget_password_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/forgot_password/fogot_password_screen_mobile_view.dart';

class ForgotPasswordScreen extends BasePage<ForgotPasswordScreenState> {
  const ForgotPasswordScreen({super.key});

  @override
  ForgotPasswordScreenState createState() {
    return ForgotPasswordScreenState();
  }
}

class ForgotPasswordScreenState extends BaseStatefulPage {
  late ForgotPasswordScreenCubit _forgotPasswordScreenCubit;

  void unregisterDI() {
    if (onboardingDI.isRegistered<MobileNumberFieldCubit>()) {
      onboardingDI.unregister<MobileNumberFieldCubit>();
    }
    if (onboardingDI.isRegistered<ForgotPasswordScreenCubit>()) {
      onboardingDI.unregister<ForgotPasswordScreenCubit>();
    }
  }

  @override
  void initState() {
    unregisterDI();
    initForgotPasswordScreenDependency();
    _forgotPasswordScreenCubit = onboardingDI<ForgotPasswordScreenCubit>();
    super.initState();
  }

  @override
  void dispose() {
    unregisterDI();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    return ForgotPasswordScreenMobileView(
      forgotPasswordScreenCubit: _forgotPasswordScreenCubit,
    );
  }
}
