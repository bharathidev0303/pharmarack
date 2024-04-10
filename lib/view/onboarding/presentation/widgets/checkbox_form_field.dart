
import 'package:flutter/material.dart';

import '../../../../packages/core_flutter/dls/color/app_colors.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {super.key,
      Key? widgetKey,
      required Widget title,
      super.onSaved,
      required FormFieldSetter<bool> onChanged,
      required FormFieldValidator<bool> super.validator,
      bool super.initialValue = false,
      bool autoValidate = false})
      : super(builder: (FormFieldState<bool> state) {
          return Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: Checkbox(
                      key: widgetKey,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      value: state.value,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: (state.value ?? false)
                                ? AppColors.blueButtonColor
                                : AppColors.lightGreyTextField),
                      ),
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (state.value ?? false) {
                          return AppColors.blueButtonColor;
                        }
                        return AppColors.lightGreyTextField;
                      }),
                      checkColor: AppColors.white,
                      onChanged: (value) {
                        state.didChange(value);
                        onChanged(value);
                      },
                    ),
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 4, left: 8),
                          child: title)),
                ],
              ),
              if (state.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
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
                          state.errorText ?? '',
                          style: const TextStyle(
                              color: AppColors.redErrorColor,
                              fontSize: 11,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                )
            ],
          );
        });
}
