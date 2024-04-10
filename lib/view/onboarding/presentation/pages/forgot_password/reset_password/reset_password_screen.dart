
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/delete_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/get_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/otp_auth/save_login_data_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_reset_password_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/change_password_screen/reset_password_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/forgot_password/reset_password/reset_password_screen_mobile_view.dart';

class ResetPasswordScreen extends BasePage<ResetPasswordScreenState> {
  const ResetPasswordScreen({super.key});

  @override
  ResetPasswordScreenState createState() {
    return ResetPasswordScreenState();
  }
}

class ResetPasswordScreenState extends BaseStatefulPage {
  late ResetPasswordScreenCubit _changePasswordScreenCubit;

  @override
  void initState() {
    unregisterDI();
    initChangePasswordScreenDependency();
    _changePasswordScreenCubit = onboardingDI<ResetPasswordScreenCubit>();
    super.initState();
  }

  void unregisterDI() {
    if (onboardingDI.isRegistered<NewPasswordFieldCubit>()) {
      onboardingDI.unregister<NewPasswordFieldCubit>();
    }
    if (onboardingDI.isRegistered<ResetPasswordScreenCubit>()) {
      onboardingDI.unregister<ResetPasswordScreenCubit>();
    }
    if (onboardingDI.isRegistered<ConfirmNewPasswordCubit>()) {
      onboardingDI.unregister<ConfirmNewPasswordCubit>();
    }
    if (onboardingDI.isRegistered<RequestResetPasswordUseCase>()) {
      onboardingDI.unregister<RequestResetPasswordUseCase>();
    }
    if (onboardingDI.isRegistered<LoginUseCase>()) {
      onboardingDI.unregister<LoginUseCase>();
    }
    if (onboardingDI.isRegistered<StoreHeaderUseCase>()) {
      onboardingDI.unregister<StoreHeaderUseCase>();
    }
    if (onboardingDI.isRegistered<SaveLoginDataUseCase>()) {
      onboardingDI.unregister<SaveLoginDataUseCase>();
    }
    if (onboardingDI.isRegistered<GetResetPasswordDataUseCase>()) {
      onboardingDI.unregister<GetResetPasswordDataUseCase>();
    }
    if (onboardingDI.isRegistered<DeleteResetPasswordDataUseCase>()) {
      onboardingDI.unregister<DeleteResetPasswordDataUseCase>();
    }
  }

  @override
  void dispose() {
    unregisterDI();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ResetPasswordScreenMobileView(
        resetPasswordScreenCubit: _changePasswordScreenCubit,
      ),
    );
  }
}
