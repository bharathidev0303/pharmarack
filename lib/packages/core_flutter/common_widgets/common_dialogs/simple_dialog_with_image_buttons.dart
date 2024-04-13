import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/common_dialog_button.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SimpleAlertDialogWithImageButton extends StatelessWidget {
  final String title;
  final FontWeight? titleFontWeight;
  final String subTitle;
  final String firstButtonTitle;
  final String secondButtonTitle;
  final VoidCallback? onFirstButtonClick;

  const SimpleAlertDialogWithImageButton(
      {super.key,
      required this.title,
      this.titleFontWeight = FontWeight.normal,
      required this.subTitle,
      this.onFirstButtonClick,
      required this.firstButtonTitle,
      required this.secondButtonTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ResponsiveWrapper.of(context).isMobile
            ? MediaQuery.of(context).size.width * 0.9
            : 360,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
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
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(image: AppAssets.png.icLock.provider()),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        title,
                        style: AppTextStyles.style16W600Black(
                            color: AppColors.blackTextFieldText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        subTitle,
                        style: AppTextStyles.style12W400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonDialogButton(
                              text: firstButtonTitle,
                              textStyle: AppTextStyles.dialogActionStyle12W500,
                              buttonColor: AppColors.blueButtonColor,
                              onPressed: () {
                                onFirstButtonClick?.call();
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
