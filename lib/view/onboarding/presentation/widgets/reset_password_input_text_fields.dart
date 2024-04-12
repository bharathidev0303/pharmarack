import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_state.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/change_password_screen/reset_password_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_input_text_new.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class ResetPasswordInputTextFields extends StatefulWidget {
  final ResetPasswordScreenCubit resetPasswordScreenCubit;

  const ResetPasswordInputTextFields(
      {super.key, required this.resetPasswordScreenCubit});

  @override
  State<ResetPasswordInputTextFields> createState() {
    return _InputTextFields();
  }
}

class _InputTextFields extends State<ResetPasswordInputTextFields> {
  bool _showNewPassword = false;
  bool _showConfirmNewPassword = false;
  var _newPasswordVisibilityIcon = AppAssets.svg.icEyeClosed;
  var _confirmNewPasswordVisibilityIcon = AppAssets.svg.icEyeClosed;

  void toggleShowNewPassword() {
    setState(() {
      _showNewPassword = !(_showNewPassword);
      if (_showNewPassword) {
        _newPasswordVisibilityIcon = AppAssets.svg.icEyeOpen;
      } else {
        _newPasswordVisibilityIcon = AppAssets.svg.icEyeClosed;
      }
    });
  }

  void toggleShowConfirmNewPassword() {
    setState(() {
      _showConfirmNewPassword = !(_showConfirmNewPassword);
      if (_showConfirmNewPassword) {
        _confirmNewPasswordVisibilityIcon = AppAssets.svg.icEyeOpen;
      } else {
        _confirmNewPasswordVisibilityIcon = AppAssets.svg.icEyeClosed;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<NewPasswordFieldCubit, NewPasswordCheckState>(
          bloc: widget.resetPasswordScreenCubit.newPasswordFieldCubit,
          builder: (ctx, state) => Column(
            children: [
              OnboardingInputTextNew(
                key: const Key(OnboardingConstants.newPasswordField),
                keyBoardType: TextInputType.text,
                labelText: context
                    .localizedString.changePasswordScreenNewPasswordLabelText,
                infoColor: AppColors.mediumGreyText,
                textEditingController:
                    widget.resetPasswordScreenCubit.newPasswordFieldController,
                obscureText: !_showNewPassword,
                onChangeCallBack: (text) {
                  widget.resetPasswordScreenCubit.newPasswordFieldCubit
                      .passwordChecks(widget.resetPasswordScreenCubit
                          .newPasswordFieldController.text);
                  // if (widget.resetPasswordScreenCubit.newPasswordFieldCubit
                  //     .newPasswordPatternComplete()) {
                  widget.resetPasswordScreenCubit.validateConfirmNewPassword(
                      text,
                      widget.resetPasswordScreenCubit
                          .confirmNewPasswordFieldController.text);
                  // }
                },
                suffixIcon: InkWell(
                  onTap: toggleShowNewPassword,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _newPasswordVisibilityIcon.svg(),
                  ),
                ),
                infoText: "",
                borderColor: AppColors.lightGreyTextField,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(32),
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[A-Za-z0-9!"#$%&()*+,-./:;<>=?@[\]^_`{}|~]')),
                  FilteringTextInputFormatter.deny(' '),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Your Password must contain',
                      style: AppTextStyles.style11W500MedGrey(
                          color: AppColors.blackTextFieldText)),
                  const SizedBox(
                    height: 10,
                  ),
                  passwordCheckItem(
                      state.isAtLeastSixLetter, 'At least 8 letters'),
                  passwordCheckItem(state.isAnNumberAnUpperLowerCase,
                      'At least a number, an uppercase & a lowercase letter'),
                  passwordCheckItem(state.isSpecialChar,
                      'At least one special character (For ex: @, - , _ , . )'),
                  passwordCheckItem(state.isNoSpaceStartEnd, 'No space allow'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BlocBuilder<ConfirmNewPasswordCubit, ConfirmNewPasswordState>(
            bloc: widget.resetPasswordScreenCubit.confirmNewPasswordCubit,
            builder: (ctx, state) {
              return OnboardingInputTextNew(
                key: const Key(OnboardingConstants.confirmNewPasswordField),
                keyBoardType: TextInputType.text,
                labelText: context.localizedString
                    .changePasswordScreenConfirmNewPasswordLabelText,
                infoColor: (state is ConfirmNewPasswordInvalidState)
                    ? AppColors.redErrorColor
                    : AppColors.mediumGreyText,
                textEditingController: widget
                    .resetPasswordScreenCubit.confirmNewPasswordFieldController,
                obscureText: !_showConfirmNewPassword,
                suffixIcon: InkWell(
                  onTap: toggleShowConfirmNewPassword,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _confirmNewPasswordVisibilityIcon.svg(),
                  ),
                ),
                onChangeCallBack: (text) {
                  // if (widget.resetPasswordScreenCubit.newPasswordFieldCubit
                  //     .newPasswordPatternComplete()) {
                  widget.resetPasswordScreenCubit.validateConfirmNewPassword(
                      widget.resetPasswordScreenCubit.newPasswordFieldController
                          .text,
                      text);
                  // }
                },
                infoText: (state is ConfirmNewPasswordInvalidState)
                    ? context.localizedString
                        .changePasswordScreenPasswordNotMatchingText
                    : "",
                borderColor: (state is ConfirmNewPasswordInvalidState)
                    ? AppColors.redErrorColor
                    : AppColors.lightGreyTextField,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(32),
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[A-Za-z0-9!"#$%&()*+,-./:;<>=?@[\]^_`{}|~]')),
                  FilteringTextInputFormatter.deny(' '),
                ],
              );
            }),
      ],
    );
  }

  Widget passwordCheckItem(bool state, String str) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            state
                ? Transform.scale(
                    scale: 0.8,
                    child: const Icon(
                      Icons.check_circle_sharp,
                      color: AppColors.greenErrorTextColor,
                    ),
                  )
                : Transform.scale(
                    scale: 0.8,
                    child: const Icon(
                      Icons.cancel,
                      color: AppColors.hintTextColor,
                    ),
                  ),
            const SizedBox(width: 2),
            Text(str,
                style: AppTextStyles.style11W500MedGrey(
                    color: state
                        ? AppColors.greenErrorTextColor
                        : AppColors.hintTextColor)),
          ],
        ),
      ),
    );
  }
}
