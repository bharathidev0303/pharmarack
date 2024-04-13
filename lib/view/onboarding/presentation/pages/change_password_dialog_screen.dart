import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/dialog_card.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/change_password_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/change_password_state.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class ChangePasswordDialogScreen extends StatefulWidget {
  const ChangePasswordDialogScreen({super.key});

  @override
  State<ChangePasswordDialogScreen> createState() =>
      _ChangePasswordDialogScreenState();
}

class _ChangePasswordDialogScreenState
    extends State<ChangePasswordDialogScreen> {
  @override
  void initState() {
    super.initState();
    Future(() => _showDialog(context));
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  Future<void> _showDialog(BuildContext context) async {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return const ChangePasswordDialogCard();
      },
    );
  }
}

class ChangePasswordDialogCard extends StatelessWidget {
  const ChangePasswordDialogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<ChangePasswordCubit>(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) => _onBlocBuilder(context, state),
        listener: (context, state) => _onBlocListener(context, state),
      ),
    );
  }

  Widget _onBlocBuilder(BuildContext context, ChangePasswordState state) {
    final cubit = context.read<ChangePasswordCubit>();

    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: DialogCard(
          title: context.localizedString.changePassword,
          titleWeight: FontWeight.bold,
          actionText: context.localizedString.saveChanges,
          onClickAction: state.isActionButtonEnabled ? cubit.saveChanges : null,
          showProgress: state.isLoading,
          body: Column(
            children: [
              const SizedBox(height: 10),
              _TextField(
                key: OnboardingConstants.keyCurrentPwd,
                title: context.localizedString.enterCurrentPassword,
                onChanged: cubit.onChangeCurrentPassword,
                errorText: _getCurrentPwdError(state, context),
                successText: _getCurrentPwdSuccess(state, context),
              ),
              const SizedBox(height: 10),
              _TextField(
                  key: OnboardingConstants.keyNewPwd,
                  title: context.localizedString.enterNewPassword,
                  onChanged: cubit.passwordChecks,
                  errorText: null),
              const SizedBox(height: 10),
              passwordCheckItem(state.isAtLeastSixLetter, 'At least 8 letters'),
              passwordCheckItem(state.isAnNumberAnUpperLowerCase,
                  'At least a number, an uppercase & a lowercase letter'),
              passwordCheckItem(state.isSpecialChar,
                  'At least one special character (For ex: @, - , _ , . )'),
              passwordCheckItem(state.isNoSpaceStartEnd, 'No space allow'),
              const SizedBox(height: 10),
              _TextField(
                key: OnboardingConstants.keyConfirmPwd,
                title: context.localizedString.confirmNewPassword,
                onChanged: cubit.onChangeConfirmPassword,
                errorText: _getConfirmPwdError(state, context),
              ),
              Visibility(
                visible: state.userMessages.contains(
                  UserMessage.changePasswordFailed,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    context.localizedString.failedToChangePassword,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textFieldNameStyle11W500
                        .copyWith(color: AppColors.redErrorColor),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordCheckItem(bool state, String str) {
    return Align(
      alignment: Alignment.topLeft,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            state
                ? Transform.scale(
                    scale: 0.6,
                    child: const Icon(
                      Icons.check_circle_sharp,
                      color: AppColors.greenErrorTextColor,
                    ),
                  )
                : Transform.scale(
                    scale: 0.6,
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

  String? _getCurrentPwdError(ChangePasswordState state, BuildContext context) {
    if (state.userMessages.contains(UserMessage.currentPasswordIsEmpty)) {
      return context.localizedString.currentPasswordShouldNotBeEmpty;
    } else if (state.userMessages.contains(UserMessage.oldPasswordNoMatch)) {
      return context.localizedString.currentPasswordDidNotMatch;
    } else {
      return null;
    }
  }

  String? _getCurrentPwdSuccess(
    ChangePasswordState state,
    BuildContext context,
  ) {
    if (state.userMessages.contains(UserMessage.oldPasswordMatched)) {
      return context.localizedString.currentPasswordMatched;
    } else {
      return null;
    }
  }

  _getNewPwdError(ChangePasswordState state, BuildContext context) {
    if (state.userMessages.contains(UserMessage.newPasswordIsEmpty)) {
      return context.localizedString.newPasswordShouldNotBeEmpty;
    } else if (state.userMessages.contains(UserMessage.invalidNewPassword)) {
      return context.localizedString.passwordShouldBeMinOfSixCharacters;
    } else {
      return null;
    }
  }

  _getConfirmPwdError(ChangePasswordState state, BuildContext context) {
    if (state.userMessages.contains(UserMessage.confirmPasswordIsEmpty)) {
      return context.localizedString.confirmPasswordShouldNotBeEmpty;
    } else if (state.userMessages
        .contains(UserMessage.confirmPasswordNotMatch)) {
      return context.localizedString.confirmPasswordShouldMatch;
    } else {
      return null;
    }
  }

  _onBlocListener(BuildContext context, ChangePasswordState state) {
    if (state.userMessages.contains(UserMessage.changePasswordSuccess)) {
      Navigator.of(context).pop();
    }
  }
}

class _TextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String title;
  final String? errorText;
  final String? successText;

  const _TextField({
    super.key,
    required this.title,
    this.onChanged,
    this.errorText,
    this.successText,
  });

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final suffixIcon =
        _obscureText ? AppAssets.svg.icEyeClosed : AppAssets.svg.icEyeOpen;
    InformationType informationType = InformationType.neutral;
    if (widget.errorText != null) {
      informationType = InformationType.error;
    } else if (widget.successText != null) {
      informationType = InformationType.success;
    }
    return TextInputField(
      title: widget.title,
      onChanged: widget.onChanged,
      suffixIcon: GestureDetector(
        onTap: _togglePasswordVisibility,
        child: suffixIcon.svg(),
      ),
      obscureText: _obscureText,
      informationText: widget.errorText ?? widget.successText,
      informationType: informationType,
      inputFormatters: [
        LengthLimitingTextInputFormatter(32),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@._-]')),
        FilteringTextInputFormatter.deny(' '),
      ],
    );
  }
}
