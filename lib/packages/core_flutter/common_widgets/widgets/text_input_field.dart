import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

import '../../dls/color/app_colors.dart';
import '../../dls/text_utils/app_text_style.dart';

/// A text input field that can be used to get user input.
class TextInputField extends StatefulWidget {
  /// The title of the text field, displayed above the text field.
  final String? title;

  /// The callback that is called when the text field value changes.
  final ValueChanged<String>? onChanged;

  /// The text that is displayed below the text field with an "(i)" icon.
  /// The color of the icon and the text is determined by [informationType].
  final String? informationText;

  /// The type of the information text.
  /// default: [InformationType.neutral]
  final InformationType informationType;

  /// The icon that is displayed at the end of the text field.
  final Widget? suffixIcon;

  /// Whether the text field should obscure the text. Used for password fields.
  /// default: false
  final bool obscureText;

  /// The character that is used to obscure the text.
  /// default: '*'
  final String obscureTextCharacter;

  /// The text that is displayed inside the text field when the text field is empty.
  /// if [hintText] is provided, [hint] should not be provided and vice versa.
  final String? hintText;

  /// The Widget that is displayed inside the text field when the text field is empty.
  /// if [hint] is provided, [hintText] should not be provided and vice versa.
  final Widget? hint;

  /// Offer name, displayed on the top right corner of the text field.
  /// Also requires [offerValue] to be provided.
  final String? offerName;

  /// Offer value, displayed on the top right corner of the text field.
  /// Also requires [offerName] to be provided.
  final String? offerValue;

  /// Action to represent soft keyboard action button.
  final TextInputAction? textInputAction;

  /// Callback that is called when the user taps outside the text field.
  /// default: FocusScope.of(context).unfocus()
  final TapRegionCallback? onTapOutside;

  /// The controller that is used to control the text field.
  final TextEditingController? controller;

  final TextInputType? keyboardType;

  final EdgeInsetsGeometry titleRowPadding;

  final List<TextInputFormatter>? inputFormatters;

  TextInputField({
    super.key,
    this.title,
    this.onChanged,
    this.suffixIcon,
    this.informationText,
    this.controller,
    this.hintText,
    this.hint,
    this.offerName,
    this.offerValue,
    this.textInputAction,
    this.onTapOutside,
    this.keyboardType,
    this.informationType = InformationType.neutral,
    this.inputFormatters,
    this.obscureText = false,
    this.obscureTextCharacter = '*',
    this.titleRowPadding = const EdgeInsets.only(left: 5, bottom: 5),
  }) {
    assert(
      (hintText != null && hint == null) ||
          (hintText == null && hint != null) ||
          (hintText == null && hint == null),
      'hintText and hint should not be provided together',
    );

    assert(
      (offerName != null && offerValue != null) ||
          (offerName == null && offerValue == null),
      'offerName and offerValue should be provided together',
    );
  }

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  Color _getInformationTextColor() {
    switch (widget.informationType) {
      case InformationType.error:
        return AppColors.redErrorColor;
      case InformationType.success:
        return AppColors.green600;
      case InformationType.neutral:
      default:
        return AppColors.secondaryTextColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide.none,
    );

    Widget? suffixIcon;
    if (widget.suffixIcon != null) {
      suffixIcon = Padding(
        padding: const EdgeInsets.only(right: 8),
        child: widget.suffixIcon,
      );
    }
    final onTapOutside =
        widget.onTapOutside ?? (_) => FocusScope.of(context).unfocus();
    final textStyle = context.textStyles.paragraph1Regular;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleRow(context),
        SizedBox(
          height: 40,
          child: TextField(
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscureTextCharacter,
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            onTapOutside: onTapOutside,
            keyboardType: widget.keyboardType,
            style: textStyle?.copyWith(color: context.colors.textPrimary),
            decoration: InputDecoration(
              fillColor: AppColors.textFieldBackground,
              filled: true,
              focusedBorder: border,
              border: border,
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 34, // 24 + 8 right-padding
                maxHeight: 24,
              ),
              hintText: widget.hintText,
              hintStyle: textStyle?.copyWith(
                color: context.colors.textSecondary,
              ),
              label: widget.hint,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            inputFormatters: widget.inputFormatters ?? [],
          ),
        ),
        Visibility(
          visible: widget.informationText != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              // Error and success text
              children: [
                AppAssets.svg.infoCircle.svg(
                  package: 'core_flutter',
                  colorFilter: ColorFilter.mode(
                    _getInformationTextColor(),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.informationText ?? '',
                  style: AppTextStyles.style10W400
                      .copyWith(color: _getInformationTextColor()),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Padding(
      padding: widget.titleRowPadding,
      child: Row(
        children: [
          Visibility(
            visible: widget.title != null,
            child: Text(
              widget.title ?? '',
              style: context.textStyles.paragraph3Medium
                  ?.copyWith(color: context.colors.textSecondary),
            ),
          ),
          const Spacer(flex: 1),
          Visibility(
            visible: widget.offerName != null && widget.offerValue != null,
            child: RichText(
              text: TextSpan(
                text: '${widget.offerName}: ',
                style: context.textStyles.paragraph3Regular?.copyWith(
                  color: context.colors.offers,
                ),
                children: [
                  TextSpan(
                    text: widget.offerValue ?? '',
                    style: context.textStyles.paragraph3Medium?.copyWith(
                      color: context.colors.offers,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// The type of the information text that is displayed below the text field.
/// [error] is displayed in red
/// [success] is displayed in green
/// [neutral] is displayed in grey.
enum InformationType {
  error,
  success,
  neutral,
}
