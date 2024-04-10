
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class OnboardingInputTextNew extends StatelessWidget {
  final TextEditingController textEditingController;
  final void Function(String) onChangeCallBack;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? extraChild;
  final Widget? suffixIcon;
  final Color borderColor;
  final Color infoColor;
  final bool obscureText;
  final String labelText;
  final TextInputType keyBoardType;
  final String infoText;
  final int? maxLength;

  const OnboardingInputTextNew({
    super.key,
    required this.labelText,
    required this.infoColor,
    required this.textEditingController,
    required this.onChangeCallBack,
    required this.infoText,
    required this.borderColor,
    required this.keyBoardType,
    this.obscureText = false,
    this.extraChild,
    this.suffixIcon,
    this.inputFormatters,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(labelText,
              style: AppTextStyles.style11W500MedGrey(
                  color: AppColors.mediumGreyText)),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.lightGreyTextField,
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            key: const Key(OnboardingConstants.commonTextField),
            obscuringCharacter: "*",
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColors.blackTextFieldText,
            ),
            controller: textEditingController,
            inputFormatters: inputFormatters,
            keyboardType: keyBoardType,
            cursorColor: AppColors.blackTextFieldText,
            onChanged: onChangeCallBack,
            obscureText: obscureText,
            maxLength: maxLength,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: suffixIcon,
              counterText: "",
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 34,
                maxHeight: 24,
              ),
              contentPadding: const EdgeInsets.only(
                  top: 12, bottom: 11, left: 10, right: 10),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(5)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(5)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (infoText.isNotEmpty)
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2, top: 2),
                      child: Icon(
                        Icons.info_outline,
                        size: 12,
                        color: infoColor,
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Text(
                        key: const Key(OnboardingConstants.commonHintText),
                        infoText,
                        style: TextStyle(
                            color: infoColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            if (extraChild != null) const Spacer(),
            if (extraChild != null)
              Align(alignment: Alignment.topRight, child: extraChild!),
          ],
        ),
      ],
    );
  }
}
