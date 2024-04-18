import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/device_detector_widget.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/login_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/login_mobile_view.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/login_web_view.dart';

class LoginScreen extends BasePage<LoginScreenState> {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends BaseStatefulPage {
  late LoginScreenCubit _loginScreenCubit;

  void unregisterDI() {
    if (onboardingDI.isRegistered<LoginScreenCubit>()) {
      onboardingDI.unregister<LoginScreenCubit>();
    }
    if (onboardingDI.isRegistered<LoginScreenTextCubit>()) {
      onboardingDI.unregister<LoginScreenTextCubit>();
    }
    if (onboardingDI.isRegistered<PasswordCubit>()) {
      onboardingDI.unregister<PasswordCubit>();
    }
  }

  @override
  void initState() {
    super.initState();
    unregisterDI();
    initOneSignalLogin();
    initDependency();
    _loginScreenCubit = onboardingDI<LoginScreenCubit>();
  }

  Future initOneSignalLogin() async {
    await initOneSignal();
  }

  @override
  Widget buildView(BuildContext context) {
    return DeviceDetectorWidget(
      webSiteView: () =>
          LoginScreenWebView(loginScreenCubit: _loginScreenCubit),
      phoneView: () => LoginScreenMobileView(
        loginScreenCubit: _loginScreenCubit,
      ),
    );
  }

  @override
  void dispose() {
    unregisterDI();
    super.dispose();
  }
}
