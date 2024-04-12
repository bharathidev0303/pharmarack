import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class OnboardingDropDownNew extends StatefulWidget {
  final void Function(String?) onChangeCallBack;
  final String labelText;
  final List<DropdownMenuEntry> dropdownItems;
  final String? defaultValue;
  final bool enable;
  final GlobalKey<FormFieldState>? dropDownState;
  final FormFieldValidator<String> validator;

  const OnboardingDropDownNew(
      {super.key,
      required this.labelText,
      required this.onChangeCallBack,
      required this.dropdownItems,
      this.defaultValue,
      this.enable = true,
      this.dropDownState,
      required this.validator});

  @override
  State<OnboardingDropDownNew> createState() => _OnboardingDropDownNewState();
}

class _OnboardingDropDownNewState extends State<OnboardingDropDownNew> {
  String? selectedValue;
  String? infoText;

  @override
  Widget build(BuildContext context) {
    var requiredBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: infoText == null
                ? AppColors.lightGreyTextField
                : AppColors.redErrorColor),
        borderRadius: BorderRadius.circular(5));

    return Column(
      key: widget.key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: AppTextStyles.style11W500MedGrey()),
        const SizedBox(
          height: 5,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<String>(
            key: widget.dropDownState,
            isExpanded: true,
            hint: Text(
                (widget.defaultValue == null)
                    ? context.localizedString.select
                    : widget.defaultValue.toString(),
                style: AppTextStyles.style12NormalBlack(
                  color: AppColors.hintTextColor,
                )),
            // hint: Text(widget.defaultValue.toString()),
            value: selectedValue,
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: 2 + 2 == 4
                ? const IconStyleData(
                    icon: Icon(
                      Icons.expand_more,
                      color: AppColors.blueButtonColor,
                    ),
                    iconSize: 24,
                  )
                : const IconStyleData(
                    icon: Icon(
                      Icons.expand_less,
                      color: AppColors.blueButtonColor,
                    ),
                    iconSize: 24,
                  ),
            dropdownStyleData: const DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.only(left: 16),
            ),
            validator: (value) {
              String? validationResult = widget.validator(value);
              setState(() {
                infoText = validationResult;
              });
              if (validationResult != null) return '';
              return null;
            },
            onChanged: widget.enable
                ? (value) {
                    setState(() {
                      selectedValue = value?.toString() ?? '';
                      infoText = null;
                    });
                    widget.onChangeCallBack(selectedValue);
                  }
                : null,
            items: widget.dropdownItems.map((menuItem) {
              return DropdownMenuItem<String>(
                value: menuItem.value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Text(
                    menuItem.label,
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: AppColors.blackTextFieldText,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              );
            }).toList(),
            decoration: InputDecoration(
              enabled: widget.enable,
              counter: const SizedBox(),
              fillColor: AppColors.lightGreyTextField,
              filled: true,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              border: requiredBorder,
              focusedBorder: requiredBorder,
              enabledBorder: requiredBorder,
              disabledBorder: requiredBorder,
              errorBorder: requiredBorder,
              focusedErrorBorder: requiredBorder,
              errorStyle: const TextStyle(
                fontSize: 0,
              ),
            ),
          ),
        ),
        if (infoText != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2, right: 2),
                child: Icon(
                  Icons.info_outline,
                  size: 12,
                  color: AppColors.redErrorColor,
                ),
              ),
              Flexible(
                child: Text(
                  infoText ?? '',
                  style: const TextStyle(
                      color: AppColors.redErrorColor,
                      fontSize: 11,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
              ),
            ],
          )
      ],
    );
  }
}
