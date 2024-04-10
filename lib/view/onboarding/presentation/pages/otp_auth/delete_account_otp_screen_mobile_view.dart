
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/loader_dialog.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_state.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_otp_text_field.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../../cubit/forgot_password/otp_screen/delete_profile_otp_screen_cubit.dart';
import '../../cubit/forgot_password/otp_screen/delete_profile_otp_screen_state.dart';

class DeleteAccountOtpScreenMobileView extends StatefulWidget {
  final DeleteAccountOtpScreenCubit deleteAccountOtpScreenCubit;

  const DeleteAccountOtpScreenMobileView(
      {super.key, required this.deleteAccountOtpScreenCubit});

  @override
  State<DeleteAccountOtpScreenMobileView> createState() =>
      _DeleteAccountOtpScreenMobileViewState();
}

class _DeleteAccountOtpScreenMobileViewState
    extends State<DeleteAccountOtpScreenMobileView> {
  @override
  void initState() {
    super.initState();
    widget.deleteAccountOtpScreenCubit.requestOtp('');
  }

  @override
  Widget build(BuildContext context) {
    widget.deleteAccountOtpScreenCubit.resendButtonCubit.startTimer();
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
                  child: AppAssets.png.newPrLogo
                      .image(width: 144, height: 66),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  context.localizedString.otpScreenLabelText,
                  style: AppTextStyles.style14W500Black(
                      color: AppColors.mediumGreyText),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    context.localizedString.otpScreenHelperText,
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
                BlocConsumer<DeleteAccountOtpScreenCubit,
                    DeleteAccountOtpScreenState>(
                  listener: (ctx, state) {
                    if (state is DeleteAccountOtpScreenInitialState) {
                      widget.deleteAccountOtpScreenCubit.requestOtp('');
                    }
                    if (state is DeleteAccountOtpScreenLoadingState) {
                      showDialog(
                          context: context,
                          builder: (_) => PopScope(
                                canPop: false,
                                child: LoaderDialog(
                                    title: context.localizedString
                                        .onboardingLoginLoadingTitle,
                                    subTitle: context.localizedString
                                        .onboardingLoginLoadingMessage),
                              ));
                    }
                    if (state is DeleteAccountOtpScreenErrorState) {
                      Navigator.of(context).pop();
                    }
                    if (state is AccountDeletedSuccessState) {
                      widget.deleteAccountOtpScreenCubit
                          .navigateToLoginScreen(context);
                      showSuccessDialog(
                        context,
                        title: context.localizedString.profileDeleted,
                        subtitle:
                            context.localizedString.profileDeletedSuccesfully,
                        closeClick: () {
                          Navigator.pop(context);
                        },
                      );

                    }

                    if (state is DeleteAccountResendOtpErrorState) {
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
                  bloc: widget.deleteAccountOtpScreenCubit,
                  builder: (ctx, state) => Center(
                    child: OnboardingCommonOtpTextField(
                        key: const Key(OnboardingConstants.otpScreenTextField),
                        length: 6,
                        textFieldController: widget
                            .deleteAccountOtpScreenCubit.otpTextFieldController,
                        onChangedCallback: (text) {
                          widget.deleteAccountOtpScreenCubit.validateOtp(text);
                        },
                        borderColor: (state is DeleteAccountOtpScreenErrorState)
                            ? AppColors.redErrorColor
                            : AppColors.lightGreyTextField,
                        errorText: (state is DeleteAccountOtpScreenErrorState)
                            ? state.statusMessage ?? ""
                            : ""),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(context.localizedString.otpScreenResendButtonText,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style11W500MedGrey(
                          color: AppColors.mediumGreyText)),
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<ResendButtonCubit, ResendButtonState>(
                    bloc: widget.deleteAccountOtpScreenCubit.resendButtonCubit,
                    builder: (ctx, state) {
                      return Center(
                        child: InkWell(
                            key: const Key(OnboardingConstants.resendButton),
                            onTap: (state is ResendButtonDisabledState)
                                ? null
                                : () {
                                    widget.deleteAccountOtpScreenCubit
                                        .resendOtp();
                                  },
                            child: Text(
                                context.localizedString
                                    .forgotPasswordOtpScreenResendButtonText,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.style11W500MedGrey(
                                    color: (state is ResendButtonDisabledState)
                                        ? AppColors.blueButtonDisabledColor
                                        : AppColors.blueButtonColor))),
                      );
                    }),
                const Spacer(),
                BlocBuilder<OtpFieldCubit, OtpTextState>(
                    bloc: widget.deleteAccountOtpScreenCubit.otpFieldCubit,
                    builder: (ctx, state) => OnboardingCommonButton(
                        key: const Key(OnboardingConstants.continueOtpButton),
                        buttonBackgroundColor: (state is OtpValidState)
                            ? AppColors.blueButtonColor
                            : AppColors.blueButtonDisabledColor,
                        onPressedCallback: (state is OtpValidState)
                            ? () {
                                Navigator.of(context).pop;
                                widget.deleteAccountOtpScreenCubit
                                    .deleteAccount("");
                              }
                            : () {},
                        buttonText:
                            context.localizedString.otpScreenVerifyButtonText)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
