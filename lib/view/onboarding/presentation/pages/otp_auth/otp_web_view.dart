
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_state.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/otp_screen/otp_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/otp_screen/otp_screen_state.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_otp_text_field.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';


class OtpScreenWebView extends StatelessWidget {
  final OtpScreenCubit otpScreenCubit;

  const OtpScreenWebView({super.key, required this.otpScreenCubit});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      /// BlocListener is useful to perform operations in response to state changes
      /// which don't need UI rebuild like showing snackBar, popup dialog,
      /// navigation
      bloc: otpScreenCubit,
      listener: (context, state) {
        switch (state.runtimeType) {
          case const (OtpScreenLoadingState):
            {
              showProcessingRequestDialog(context);
            }
            break;
          case const (OtpScreenErrorState):
            {
              CommonDialogs.closeCommonDialog(context: context);
              showFailureDialog(context,
                  title: context.localizedString.dialogFailureHeader,
                  subtitle: context.localizedString.onboardingOTPLoadErrorText);
            }
            break;
          case const (OtpScreenDataState):
            {
              CommonDialogs.closeCommonDialog(context: context);
            }
            break;
          case const (OtpVerificationFailedState):
            {
              CommonDialogs.closeCommonDialog(context: context);
            }
            break;
          case const (OtpVerificationState):
            {
              showProcessingRequestDialog(context);
            }
            break;
          case const (OtpVerificationSuccessState):
            {
              CommonDialogs.closeCommonDialog(context: context);
              otpScreenCubit.navigateToDashboard(context);
            }
            break;

          case const (EmptyOtpState):
            {
              CommonDialogs.closeCommonDialog(context: context);
              CommonDialogs.showSimpleDialog(
                  parentContext: context,
                  title: context.localizedString.attention,
                  subTitle: context.localizedString.enterOtp,
                  buttonTitle: context.localizedString.ok,
                  barrierDismissible: true);
            }
            break;
        }
      },
      child: BlocProvider(
        create: (context) => otpScreenCubit,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: AppAssets.png.newPrLogo.image(
                         width: 167, height: 115),
                  ),
                  const SizedBox(
                    height: 59,
                  ),
                  Center(
                    child: Text(
                      context.localizedString.otpScreenLabelText,
                      style: AppTextStyles.style14W500Black(
                          color: AppColors.mediumGreyText),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Center(
                    child: Text(
                      context.localizedString.otpScreenHelperText,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style11W500MedGrey(),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<OtpScreenCubit, OtpScreenState>(
                    bloc: otpScreenCubit,
                    builder: (ctx, state) => Center(
                      child: OnboardingCommonOtpTextField(
                        key: const Key(OnboardingConstants.otpField),
                        length: 6,
                        textFieldController: otpScreenCubit.otpFieldController,
                        borderColor: (state is OtpVerificationFailedState)
                            ? AppColors.redErrorColor
                            : AppColors.lightGreyTextField,
                        onChangedCallback: (text) {
                          otpScreenCubit.validateOtp();
                        },
                        errorText: (state is OtpVerificationFailedState)
                            ? context
                                .localizedString.otpVerificationFailedErrorText
                            : "",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<OtpFieldCubit, OtpTextState>(
                    bloc: otpScreenCubit.otpFieldCubit,
                    builder: (context, state) {
                      return SizedBox(
                        width: 313,
                        child: OnboardingCommonButton(
                          key: const Key(OnboardingConstants.otpButtonField),
                          buttonText:
                              context.localizedString.otpScreenVerifyButtonText,
                          buttonBackgroundColor: (state is OtpInvalidState ||
                                  state is OtpInitState)
                              ? AppColors.blueButtonDisabledColor
                              : AppColors.blueButtonColor,
                          onPressedCallback: (state is OtpInvalidState ||
                                  state is OtpInitState)
                              ? null
                              : () {
                                  otpScreenCubit.verifyOtp();
                                },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 49,
                  ),
                  Center(
                    child: Text(
                        context.localizedString.otpScreenResendHelperText,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.style11W500MedGrey(
                            color: AppColors.mediumGreyText)),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  BlocBuilder<ResendButtonCubit, ResendButtonState>(
                    bloc: otpScreenCubit.resendButtonCubit,
                    builder: (ctx, state) {
                      return Center(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          key: const Key(OnboardingConstants.resendButton),
                          onTap: (state is ResendButtonDisabledState)
                              ? null
                              : () {
                                  otpScreenCubit.resendOtp();
                                },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Text(
                              context.localizedString.otpScreenResendButtonText,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.style11W500MedGrey(
                                  color: (state is ResendButtonDisabledState)
                                      ? AppColors.blueButtonDisabledColor
                                      : AppColors.blueButtonColor),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
