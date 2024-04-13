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
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_otp_text_field.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../../widgets/onboarding_common_button.dart';

class OtpScreenMobileView extends StatelessWidget {
  final OtpScreenCubit otpScreenCubit;

  const OtpScreenMobileView({super.key, required this.otpScreenCubit});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
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
          case const (OtpPageUnAuthorizedDetectState):
            {
              CommonDialogs.closeCommonDialog(context: context);
              Navigator.of(context).pop();
              Navigator.pushNamed(
                context,
                '/operationsPage',
              );
            }
            break;
          case const (OtpVerificationDeleteAccountState):
            {
              CommonDialogs.closeCommonDialog(context: context);
              otpScreenCubit.deleteAccount();
            }
            break;

          case const (OtpVerificationDeleteAccountSuccessState):
            {
              otpScreenCubit.navigateToLoginScreen(context);
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
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 16, right: 16, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child:
                          AppAssets.png.newPrLogo.image(width: 144, height: 66),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        context.localizedString.otpScreenLabelText,
                        style: AppTextStyles.style14W500Black(
                            color: AppColors.mediumGreyText),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        context.localizedString.otpScreenHelperText,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.style12W400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<OtpScreenCubit, OtpScreenState>(
                      bloc: otpScreenCubit,
                      builder: (ctx, state) => Center(
                        child: OnboardingCommonOtpTextField(
                          key: const Key(OnboardingConstants.otpField),
                          length: 6,
                          textFieldController:
                              otpScreenCubit.otpFieldController,
                          borderColor: (state is OtpVerificationFailedState)
                              ? AppColors.redErrorColor
                              : AppColors.lightGreyTextField,
                          onChangedCallback: (text) {
                            otpScreenCubit.validateOtp();
                          },
                          errorText: (state is OtpVerificationFailedState)
                              ? state.statusMessage == 'otp verification failed'
                                  ? context.localizedString
                                      .otpVerificationFailedErrorText
                                  : state.statusMessage ?? ''
                              : "",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Text(
                          context.localizedString.otpScreenResendHelperText,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.style11W500MedGrey(
                              color: AppColors.mediumGreyText)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocBuilder<ResendButtonCubit, ResendButtonState>(
                      bloc: otpScreenCubit.resendButtonCubit,
                      builder: (ctx, state) {
                        if (state is ResendButtonDisabledState) {
                          return Center(
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              key: const Key(OnboardingConstants.resendButton),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: 20,
                                ),
                                child: Text(
                                  "Resend OTP in ${state.timer}",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.style11W500MedGrey(
                                      color: AppColors.blueButtonDisabledColor),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              key: const Key(OnboardingConstants.resendButton),
                              onTap: () {
                                otpScreenCubit.resendOtp();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: 20,
                                ),
                                child: Text(
                                  context.localizedString
                                      .otpScreenResendButtonText,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.style11W500MedGrey(
                                      color: AppColors.blueButtonColor),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    Expanded(child: Container()),
                    BlocBuilder<OtpFieldCubit, OtpTextState>(
                      bloc: otpScreenCubit.otpFieldCubit,
                      builder: (context, state) {
                        return OnboardingCommonButton(
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
