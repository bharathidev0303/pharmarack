
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';


import '../../cubit/forgot_password/otp_screen/delete_profile_otp_screen_cubit.dart';
import 'delete_account_otp_screen_mobile_view.dart';

class DeleteAccountOtpScreen extends BasePage<DeleteAccountOtpScreenState> {
  const DeleteAccountOtpScreen({super.key});

  @override
  DeleteAccountOtpScreenState createState() {
    return DeleteAccountOtpScreenState();
  }
}

class DeleteAccountOtpScreenState extends BaseStatefulPage {
  late DeleteAccountOtpScreenCubit _deleteAccountOtpScreenOtpScreenCubit;

  @override
  void initState() {
    unregisterDI();
    initDeleteAccountOtpDependency();
    _deleteAccountOtpScreenOtpScreenCubit =
        onboardingDI<DeleteAccountOtpScreenCubit>();
    super.initState();
  }

  void unregisterDI() {
    if (onboardingDI.isRegistered<OtpFieldCubit>()) {
      onboardingDI.unregister<OtpFieldCubit>();
    }
    if (onboardingDI.isRegistered<ResendButtonCubit>()) {
      onboardingDI.unregister<ResendButtonCubit>();
    }
    if (onboardingDI.isRegistered<DeleteAccountOtpScreenCubit>()) {
      onboardingDI.unregister<DeleteAccountOtpScreenCubit>();
    }
    if (onboardingDI.isRegistered<StoreHeaderUseCase>()) {
      onboardingDI.unregister<StoreHeaderUseCase>();
    }
  }

  @override
  void dispose() {
    _deleteAccountOtpScreenOtpScreenCubit.resendButtonCubit.stopTimer();
    unregisterDI();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    return DeleteAccountOtpScreenMobileView(
      deleteAccountOtpScreenCubit: _deleteAccountOtpScreenOtpScreenCubit,
    );
  }
}
