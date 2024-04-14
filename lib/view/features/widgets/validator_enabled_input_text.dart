import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

class ValidatorEnabledInputTextNew extends StatefulWidget {
  final void Function(String) onChangeCallBack;
  final FormFieldValidator<String> validator;
  final String labelText;
  final TextInputType? textInputType;
  final int? maxLength;
  final String? defaultValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool textCapitalization;
  final bool enable;
  final TextEditingController? controller;
  final bool isPasswordField;
  final String? infoText;
  final String apiValidationMessage;
  final Color? cursorColor;
  final Key? widgetKey;
  final bool? isEditable;

  const ValidatorEnabledInputTextNew({
    super.key,
    this.widgetKey,
    required this.labelText,
    required this.onChangeCallBack,
    required this.validator,
    this.inputFormatters,
    this.textInputType,
    this.maxLength,
    this.defaultValue,
    this.enable = true,
    this.controller,
    this.isPasswordField = false,
    this.infoText,
    this.textCapitalization = false,
    this.apiValidationMessage = '',
    this.cursorColor = Colors.black,
    this.isEditable,
  });

  @override
  State<ValidatorEnabledInputTextNew> createState() =>
      _ValidatorInputTextNewState();
}

class _ValidatorInputTextNewState extends State<ValidatorEnabledInputTextNew> {
  String? _errorText;
  bool _hideText = false;

  @override
  void initState() {
    super.initState();
    _hideText = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    var requiredBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: _errorText == null
                ? AppColors.blackTextColor
                : AppColors.redErrorColor),
        borderRadius: BorderRadius.circular(5));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: AppTextStyles.style11W500MedGrey()),
        const SizedBox(
          height: 2,
        ),
        TextFormField(
          key: widget.widgetKey,
          controller: widget.controller,
          obscureText: _hideText,
          cursorColor: widget.cursorColor,
          style: context.textStyles.header6Regular?.copyWith(
              color: widget.isEditable != true
                  ? AppColors.blackTextFieldText
                  : AppColors.greyText,
              overflow: TextOverflow.ellipsis),
          textCapitalization: widget.textCapitalization
              ? TextCapitalization.characters
              : TextCapitalization.none,
          validator: (value) {
            if (widget.apiValidationMessage.isNotEmpty) {
              setState(() {
                _errorText = widget.apiValidationMessage;
              });
              return '';
            }

            String? validationResult = widget.validator(value);
            setState(() {
              _errorText = validationResult;
            });
            if (validationResult != null) {
              return '';
            }
            return null;
          },
          onChanged: (value) {
            if (_errorText != null) {
              setState(() {
                _errorText = null;
              });
            }
            widget.onChangeCallBack(value);
          },
          inputFormatters: widget.inputFormatters,
          enabled: widget.enable,
          initialValue: widget.defaultValue,
          keyboardType: widget.textInputType,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            counter: const SizedBox(),
            fillColor: AppColors.white,
            filled: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            border: requiredBorder,
            focusedBorder: requiredBorder,
            disabledBorder: requiredBorder,
            enabledBorder: requiredBorder,
            errorBorder: requiredBorder,
            focusedErrorBorder: requiredBorder,
            errorStyle: const TextStyle(
              fontSize: 0,
            ),
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      !_hideText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.blueButtonColor,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _hideText = !_hideText;
                      });
                    },
                  )
                : null,
          ),
        ),
        if (_errorText != null || widget.apiValidationMessage.isNotEmpty)
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
                  _errorText ?? widget.apiValidationMessage,
                  style: context.textStyles.header11Medium?.copyWith(
                      color: AppColors.redErrorColor,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        if (_errorText == null &&
            widget.apiValidationMessage.isEmpty &&
            widget.infoText != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2, right: 2),
                child: Icon(
                  Icons.info_outline,
                  size: 12,
                  color: AppColors.mediumGreyText,
                ),
              ),
              Flexible(
                child: Text(
                  widget.infoText ?? '',
                  style: context.textStyles.header11Medium?.copyWith(
                      color: AppColors.mediumGreyText,
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
