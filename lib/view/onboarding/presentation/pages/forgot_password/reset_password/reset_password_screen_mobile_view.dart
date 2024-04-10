
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/loader_dialog.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_state.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/change_password_screen/reset_password_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/change_password_screen/reset_password_state.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/reset_password_input_text_fields.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';


class ResetPasswordScreenMobileView extends StatelessWidget {
  final ResetPasswordScreenCubit resetPasswordScreenCubit;

  const ResetPasswordScreenMobileView(
      {super.key, required this.resetPasswordScreenCubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordScreenCubit, ResetPasswordScreenState>(
      bloc: resetPasswordScreenCubit,
      listener: (ctx, state) {
        if (state is ResetPasswordScreenDataState) {
          Navigator.of(context).pop();
          // if (onboardingDI.isRegistered<CommonSuccessDialogInfoModel>(
          //     instanceName: OnboardingConstants.showDialogDiConstant)) {
          //   onboardingDI.unregister<CommonSuccessDialogInfoModel>(
          //       instanceName: OnboardingConstants.showDialogDiConstant);
          // }
          // onboardingDI.registerSingleton<CommonSuccessDialogInfoModel>(
          //     CommonSuccessDialogInfoModel(
          //         title: context
          //             .localizedString.changePasswordSuccessDialogLabelText,
          //         subtitle:
          //             context.localizedString.changePasswordSuccessHelperText),
          //     instanceName: OnboardingConstants.showDialogDiConstant);
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     onboardingDI<OnboardingOuterRoutePaths>().getDashBoardPath(),
          //     (route) => false);
          // // Navigator.of(context).pushReplacementNamed(
          // //     onboardingDI<OnboardingOuterRoutePaths>().getDashBoardPath());
        }
        if (state is ResetPasswordScreenLoadingState) {
          showDialog(
              context: context,
              builder: (_) => PopScope(
                    canPop: false,
                    child: LoaderDialog(
                        title:
                            context.localizedString.onboardingLoginLoadingTitle,
                        subTitle: context
                            .localizedString.onboardingLoginLoadingMessage),
                  ));
        }
        if (state is ResetPasswordScreenErrorState) {
          Navigator.of(context).pop();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).clearSnackBars();
            SnackBar errorSnackBar = SnackBar(
              key: const Key(OnboardingConstants.changePasswordScreenErrorText),
              content: Center(
                child: Text(state.statusMessage ?? ""),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
          });
        }
        if (state is ResetPasswordUnAuthorizeState) {
          Navigator.of(context).pop();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).clearSnackBars();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/operationsPage', (route) => false);
          });
        }
      },
      builder: (ctx, state) => Padding(
        padding: const EdgeInsets.only(top: 20, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height * 0.9),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: AppAssets.png.newPrLogo.image(
                           width: 144, height: 66),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    context.localizedString.changePasswordScreenLabelText,
                    style: AppTextStyles.style14W500Black(
                        color: AppColors.mediumGreyText),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ResetPasswordInputTextFields(
                      resetPasswordScreenCubit: resetPasswordScreenCubit),
                  const Spacer(),
                  BlocBuilder<ConfirmNewPasswordCubit, ConfirmNewPasswordState>(
                      bloc: resetPasswordScreenCubit.confirmNewPasswordCubit,
                      builder: (ctx, state) {
                        return OnboardingCommonButton(
                            key: const Key(
                                OnboardingConstants.continuePasswordButton),
                            buttonBackgroundColor:
                                (state is ConfirmNewPasswordInvalidState ||
                                        state is ConfirmNewPasswordInitState ||
                                        state is ConfirmNewPasswordEmptyState)
                                    ? AppColors.blueButtonDisabledColor
                                    : AppColors.blueButtonColor,
                            onPressedCallback: (state
                                        is ConfirmNewPasswordInvalidState ||
                                    state is ConfirmNewPasswordInitState ||
                                    state is ConfirmNewPasswordEmptyState)
                                ? null
                                : () {
                                    resetPasswordScreenCubit.doResetPassword();
                                    // changePasswordScreenCubit
                                    //     .getResetPasswordDataAndChangePassword(context
                                    //         .localizedString
                                    //         .changePasswordScreenCommonErrorMessage);
                                  },
                            buttonText: 'SUBMIT');
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
