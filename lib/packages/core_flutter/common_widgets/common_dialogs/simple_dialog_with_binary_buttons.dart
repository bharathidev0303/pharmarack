import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/common_dialog_button.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SimpleAlertDialogWithBinaryButton extends StatelessWidget {
  final String title;
  final FontWeight? titleFontWeight;
  final String subTitle;
  final String firstButtonTitle;
  final String secondButtonTitle;
  final VoidCallback? onFirstButtonClick;
  final VoidCallback? onSecondButtonClick;
  final bool? isCrossIconHide;

  const SimpleAlertDialogWithBinaryButton(
      {super.key,
      required this.title,
      this.titleFontWeight = FontWeight.normal,
      required this.subTitle,
      this.onFirstButtonClick,
      this.onSecondButtonClick,
      required this.firstButtonTitle,
      required this.secondButtonTitle,
      this.isCrossIconHide});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ResponsiveWrapper.of(context).isMobile
            ? MediaQuery.of(context).size.width * 0.9
            : 360,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              title != "" && isCrossIconHide == false
                  ? Row(
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.dialogTitleStyle16W400.copyWith(
                              color: AppColors.blackTextFieldText,
                              fontWeight: titleFontWeight),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: AppAssets.png.close.image(
                            width: 24,
                            height: 24,
                          ),
                        )
                      ],
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: title != "" && isCrossIconHide == false ? 15 : 0,
              ),
              Text(
                subTitle,
                style: AppTextStyles.style12W500Black(
                        color: AppColors.mediumGreyText)
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  secondButtonTitle.isNotEmpty
                      ? Expanded(
                          child: CommonDialogButton(
                              text: secondButtonTitle,
                              textStyle: AppTextStyles.style12W500Black(
                                  color: AppColors.blueButtonColor),
                              buttonColor: AppColors.cardBorderColor,
                              onPressed: () {
                                onSecondButtonClick?.call();
                              }),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    width: secondButtonTitle.isNotEmpty ? 9 : 0,
                  ),
                  Expanded(
                    child: CommonDialogButton(
                        text: firstButtonTitle,
                        textStyle: AppTextStyles.style12W500Black(
                            color: AppColors.white),
                        buttonColor: AppColors.blueButtonColor,
                        onPressed: () {
                          if (onFirstButtonClick != null) {
                            onFirstButtonClick?.call();
                          } else {
                            Navigator.pop(context);
                          }
                        }),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
