import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/loader_dialog.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_state.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/forget_password_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_input_text_new.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../../../../../packages/core_flutter/dls/color/app_colors.dart';

class ForgotPasswordScreenMobileView extends StatelessWidget {
  final ForgotPasswordScreenCubit forgotPasswordScreenCubit;

  const ForgotPasswordScreenMobileView(
      {super.key, required this.forgotPasswordScreenCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppAssets.png.newPrLogo.image(width: 144, height: 66),
          const SizedBox(
            height: 24,
          ),
          BlocConsumer<ForgotPasswordScreenCubit, ForgotPasswordScreenState>(
              bloc: forgotPasswordScreenCubit,
              builder: (ctx, state) {
                return OnboardingInputTextNew(
                  key: const Key(OnboardingConstants.mobileNumberTextField),
                  keyBoardType: TextInputType.number,
                  labelText: context
                      .localizedString.forgotPasswordMobileNumberLabelText,
                  infoColor: (state is ForgotPasswordScreenErrorState)
                      ? AppColors.redErrorColor
                      : AppColors.mediumGreyText,
                  textEditingController:
                      forgotPasswordScreenCubit.mobileNumberFieldController,
                  onChangeCallBack: (text) {
                    forgotPasswordScreenCubit.validateMobileNumber(text);
                  },
                  infoText: (state is ForgotPasswordScreenErrorState)
                      ? state.statusMessage ?? ""
                      : context.localizedString.forgotPasswordInfoText,
                  borderColor: (state is ForgotPasswordScreenErrorState)
                      ? AppColors.redErrorColor
                      : AppColors.lightGreyTextField,
                  maxLength: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[\s,.-]')),
                  ],
                );
              },
              listener: (ctx, state) {
                if (state is ForgotPasswordScreenLoadingState) {
                  CommonDialogs.closeCommonDialog(context: context);
                  showProcessingRequestDialog(context,
                      title:
                          context.localizedString.onboardingLoginLoadingTitle,
                      subtitle: context
                          .localizedString.onboardingLoginLoadingMessage);
                }
                if (state is ForgotPasswordScreenErrorState) {
                  Navigator.of(context).pop();
                }
                if (state is ForgotPasswordScreenDataState) {
                  Navigator.of(context).pop();
                  forgotPasswordScreenCubit.mobileNumberFieldController.text =
                      "";
                  forgotPasswordScreenCubit.validateMobileNumber("");
                  Navigator.of(context)
                      .pushNamed(RoutePaths.forgotPasswordOtpScreen);
                }
              }),
          const Spacer(),
          BlocBuilder<MobileNumberFieldCubit, MobileNumberTextState>(
              bloc: forgotPasswordScreenCubit.mobileNumberFieldCubit,
              builder: (ctx, state) => OnboardingCommonButton(
                  key: const Key(OnboardingConstants.sendOtpButton),
                  buttonText: context
                      .localizedString.forgotPasswordMobileNumberButtonText,
                  buttonBackgroundColor: (state is MobileNumberTextValidState)
                      ? AppColors.blueButtonColor
                      : AppColors.blueButtonDisabledColor,
                  onPressedCallback: (state is MobileNumberTextValidState)
                      ? () {
                          forgotPasswordScreenCubit.requestForgetPassword();
                        }
                      : null)),
        ],
      ),
    );
  }
}
