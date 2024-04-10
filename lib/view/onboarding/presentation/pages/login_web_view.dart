
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/login_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/login_screen_state.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/input_text_fields.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/login_create_account_widget.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../cubit/common/input_text_state.dart';


class LoginScreenWebView extends StatelessWidget {
  final LoginScreenCubit loginScreenCubit;

  const LoginScreenWebView({super.key, required this.loginScreenCubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreenCubit, LoginScreenState>(
      bloc: loginScreenCubit,
      listener: (ctx, state) {
        if (state is LoginScreenUsernameNotValidState ||
            state is LoginScreenPasswordNotValidState) {
          CommonDialogs.closeCommonDialog(context: context);
        }
        if (state is LoginScreenErrorState) {
          CommonDialogs.closeCommonDialog(context: context);
          showFailureDialog(context,
              title: context.localizedString.dialogFailureHeader,
              subtitle: context
                  .localizedString.changePasswordScreenCommonErrorMessage);
        }
        // if (state is LoginScreenDataState) {
        //   CommonDialogs.closeCommonDialog(context: context);
        //   if (onboardingDI.isRegistered<CommonSuccessDialogInfoModel>(
        //       instanceName: OnboardingConstants.showDialogDiConstant)) {
        //     onboardingDI.unregister<CommonSuccessDialogInfoModel>(
        //         instanceName: OnboardingConstants.showDialogDiConstant);
        //   }
        //   onboardingDI.registerSingleton<CommonSuccessDialogInfoModel>(
        //       CommonSuccessDialogInfoModel(
        //           title: context.localizedString.loginSuccessDialogTitleText,
        //           subtitle:
        //               context.localizedString.loginSuccessDialogSubtitleText),
        //       instanceName: OnboardingConstants.showDialogDiConstant);
        //   Navigator.of(context).pushNamed(
        //       onboardingDI<OnboardingOuterRoutePaths>().getOtpPath());
        // }
        if (state is LoginScreenLoadingState) {
          showProcessingRequestDialog(context);
        }
      },
      builder: (ctx, state) {
        return CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: AppAssets.png.newPrLogo
                      .image(width: 167, height: 115),
                ),
                const SizedBox(
                  height: 39,
                ),
                SizedBox(
                  width: 313,
                  child: LoginScreenInputTextFields(
                    loginScreenCubit: loginScreenCubit,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                SizedBox(
                  width: 313,
                  child:
                      BlocBuilder<LoginScreenTextCubit, LoginScreenTextState>(
                    bloc: loginScreenCubit.loginScreenTextCubit,
                    builder: (context, state) {
                      return OnboardingCommonButton(
                        key: const Key(OnboardingConstants.loginButton),
                        buttonText:
                            context.localizedString.onboardingLoginButtonText,
                        buttonBackgroundColor:
                            (state is LoginScreenTextInvalidState ||
                                    state is LoginScreenTextInitState)
                                ? AppColors.blueButtonDisabledColor
                                : AppColors.blueButtonColor,
                        onPressedCallback:
                            (state is LoginScreenTextInvalidState ||
                                    state is LoginScreenTextInitState)
                                ? null
                                : () {
                                    loginScreenCubit.onLoginPressed();
                                  },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                const LoginCreateAccountWidget(),
              ],
            ),
          ),
        ]);
      },
    );
  }
}
