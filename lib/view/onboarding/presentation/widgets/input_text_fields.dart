import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/login_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/login_screen_state.dart';
import 'package:pharmarack/view/onboarding/presentation/navigation/onboarding_outer_route_paths.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_input_text_new.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../../../../packages/core_flutter/dls/text_utils/app_text_style.dart';

class LoginScreenInputTextFields extends StatefulWidget {
  final LoginScreenCubit loginScreenCubit;

  const LoginScreenInputTextFields({super.key, required this.loginScreenCubit});

  @override
  State<LoginScreenInputTextFields> createState() {
    return _InputTextFields();
  }
}

class _InputTextFields extends State<LoginScreenInputTextFields> {
  bool _showPassword = false;
  var _visibilityIcon = AppAssets.svg.icEyeClosed;

  void toggleShowPassword() {
    setState(() {
      _showPassword = !(_showPassword);
      if (_showPassword) {
        _visibilityIcon = AppAssets.svg.icEyeOpen;
      } else {
        _visibilityIcon = AppAssets.svg.icEyeClosed;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      bloc: widget.loginScreenCubit,
      builder: (ctx, state) => Column(
        children: [
          (state is LoginScreenPasswordNotValidState ||
                  state is LoginScreenUsernameNotValidState)
              ? Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.redErrorColor),
                      color: AppColors.red600.withOpacity(0.3)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    child: Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: AppColors.redErrorColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Invalid credentials, Please verify them and retry.',
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.style12W500Black(
                                color: AppColors.redErrorColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          OnboardingInputTextNew(
            key: const Key(OnboardingConstants.usernameField),
            labelText: context.localizedString.onboardingLoginUsernameHintText,
            infoText: "",
            textEditingController: widget.loginScreenCubit.userNameController,
            onChangeCallBack: (text) {
              widget.loginScreenCubit.validateUsernameAndPassword();
            },
            borderColor: AppColors.lightGreyTextField,
            keyBoardType: TextInputType.text,
            infoColor: AppColors.redErrorColor,
            suffixIcon: null,
            obscureText: false,
            // inputFormatters: [
            //   FilteringTextInputFormatter.deny(RegExp(r'[\s@#₹%^&+()/*":;!?]')),
            // ],
          ),
          const SizedBox(
            height: 15,
          ),
          OnboardingInputTextNew(
            key: const Key(OnboardingConstants.passwordField),
            labelText: context.localizedString.onboardingLoginPasswordHintText,
            textEditingController: widget.loginScreenCubit.passwordController,
            infoText: "",
            obscureText: !_showPassword,
            onChangeCallBack: (text) {
              widget.loginScreenCubit.validateUsernameAndPassword();
            },
            borderColor: AppColors.lightGreyTextField,
            keyBoardType: TextInputType.text,
            infoColor: AppColors.lightGreyTextField,
            extraChild: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(RoutePaths.forgotPasswordScreen);
              },
              child: Text(
                context.localizedString.onboardingLoginForgotPassword,
                style: AppTextStyles.textFieldNameStyle11W500
                    .copyWith(color: AppColors.blueButtonColor),
              ),
            ),
            suffixIcon: InkWell(
              onTap: toggleShowPassword,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _visibilityIcon.svg(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
