
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pinput/pinput.dart';

class OnboardingCommonOtpTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  final int length;
  final void Function(String) onChangedCallback;
  final Color borderColor;
  final String errorText;

  const OnboardingCommonOtpTextField(
      {super.key,
      required this.length,
      required this.textFieldController,
      required this.onChangedCallback,
      required this.borderColor,
      required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Pinput(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          length: length,
          controller: textFieldController,
          onChanged: onChangedCallback,
          defaultPinTheme: PinTheme(
            width: 40,
            height: 40,
            textStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.blueButtonColor,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.lightGreyTextField,
              border: Border.all(color: borderColor),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (errorText.isNotEmpty &&
            errorText == context.localizedString.otpVerificationFailedErrorText)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(
                  Icons.info_outline,
                  size: 12,
                  color: AppColors.redErrorColor,
                ),
              ),
              Text(errorText,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.style11W500MedGrey(
                      color: AppColors.redErrorColor)),
            ],
          ),
        if (errorText.isNotEmpty &&
            errorText ==
                "You've exceed the number of attempts for OTP verification. Please try again after 5 mins.")
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 4, top: 2),
                  child: Icon(
                    Icons.info_outline,
                    size: 12,
                    color: AppColors.redErrorColor,
                  ),
                ),
                Expanded(
                  child: Text(errorText,
                      style: AppTextStyles.style11W500MedGrey(
                          color: AppColors.redErrorColor)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
