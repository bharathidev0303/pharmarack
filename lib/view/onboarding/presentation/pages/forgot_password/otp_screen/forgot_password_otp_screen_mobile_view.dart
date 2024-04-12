import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/loader_dialog.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_state.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/otp_screen/forget_password_otp_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/otp_screen/forgot_password_otp_screen_state.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_otp_text_field.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class ForgotPasswordOtpScreenMobileView extends StatelessWidget {
  final ForgotPasswordOtpScreenCubit forgotPasswordOtpScreenCubit;

  const ForgotPasswordOtpScreenMobileView(
      {super.key, required this.forgotPasswordOtpScreenCubit});

  @override
  Widget build(BuildContext context) {
    forgotPasswordOtpScreenCubit.resendButtonCubit.startTimer();
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 41),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AppAssets.png.newPrLogo.image(width: 144, height: 66),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text(
                    context.localizedString.forgotPasswordOtpScreenLabelText,
                    style: AppTextStyles.style14W500Black(
                        color: AppColors.mediumGreyText),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    context.localizedString.forgotPasswordOtpScreenHelperText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.mediumGreyText,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<ForgotPasswordOtpScreenCubit,
                    ForgotPasswordOtpScreenState>(
                  listener: (ctx, state) {
                    if (state is ForgotPasswordOtpScreenLoadingState) {
                      CommonDialogs.closeCommonDialog(context: context);
                      showProcessingRequestDialog(context,
                          title: context
                              .localizedString.onboardingLoginLoadingTitle,
                          subtitle: context
                              .localizedString.onboardingLoginLoadingMessage);
                    }
                    if (state is ForgotPasswordOtpScreenErrorState) {
                      Navigator.of(context).pop();
                      // Navigator.of(context).pushNamed(
                      //     onboardingDI<OnboardingOuterRoutePaths>()
                      //         .getResetPasswordScreenPath());
                    }
                    if (state is ForgotPasswordOtpScreenDataState) {
                      // Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context)
                          .pushNamed(RoutePaths.resetPasswordScreen);
                    }
                    if (state is ForgotPasswordResendOtpSuccessState) {
                      Navigator.of(context).pop();
                    }
                    if (state is ForgotPasswordResendOtpErrorState) {
                      Navigator.of(context).pop();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        SnackBar errorSnackBar = SnackBar(
                          content: Center(
                            child: Text(context.localizedString
                                .forgotPasswordOtpScreenResendErrorText),
                          ),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(errorSnackBar);
                      });
                    }
                  },
                  bloc: forgotPasswordOtpScreenCubit,
                  builder: (ctx, state) => Center(
                    child: OnboardingCommonOtpTextField(
                        key: const Key(OnboardingConstants.otpScreenTextField),
                        length: 6,
                        textFieldController:
                            forgotPasswordOtpScreenCubit.otpTextFieldController,
                        onChangedCallback: (text) {
                          forgotPasswordOtpScreenCubit.validateOtp(text);
                        },
                        borderColor:
                            (state is ForgotPasswordOtpScreenErrorState)
                                ? AppColors.redErrorColor
                                : AppColors.lightGreyTextField,
                        errorText: (state is ForgotPasswordOtpScreenErrorState)
                            ? state.statusMessage == 'Invalid Otp'
                                ? context.localizedString
                                    .otpVerificationFailedErrorText
                                : state.statusMessage ?? ""
                            : ""),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                      context.localizedString
                          .forgotPasswordOtpScreenResendHelperText,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style11W500MedGrey(
                          color: AppColors.mediumGreyText)),
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<ResendButtonCubit, ResendButtonState>(
                    bloc: forgotPasswordOtpScreenCubit.resendButtonCubit,
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
                              forgotPasswordOtpScreenCubit.resendOtp();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 20,
                              ),
                              child: Text(
                                context
                                    .localizedString.otpScreenResendButtonText,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.style11W500MedGrey(
                                    color: AppColors.blueButtonColor),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                const Spacer(),
                BlocBuilder<OtpFieldCubit, OtpTextState>(
                    bloc: forgotPasswordOtpScreenCubit.otpFieldCubit,
                    builder: (ctx, state) => OnboardingCommonButton(
                        key: const Key(OnboardingConstants.continueOtpButton),
                        buttonBackgroundColor: (state is OtpValidState)
                            ? AppColors.blueButtonColor
                            : AppColors.blueButtonDisabledColor,
                        onPressedCallback: (state is OtpValidState)
                            ? () {
                                // Navigator.of(context).pop;
                                // Navigator.of(context).pushNamed(
                                //     onboardingDI<OnboardingOuterRoutePaths>()
                                // .getResetPasswordScreenPath());
                                forgotPasswordOtpScreenCubit.requestVerifyOtp(
                                    context.localizedString
                                        .otpVerificationFailedErrorText);
                              }
                            : () {},
                        buttonText: context.localizedString
                            .forgotPasswordOtpScreenContinueButtonText)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
