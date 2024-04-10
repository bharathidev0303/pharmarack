
import 'package:flutter/cupertino.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class RegistrationStepper extends StatelessWidget {
  const RegistrationStepper({super.key, required this.currentStep});
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: AppAssets.png.prNewLogo
              .image(width: 144, height: 66),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizedString.step1,
              style: getStepperStyle(1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: AppAssets.svg.icRightArrow
                  .svg( width: 14, height: 14),
            ),
            Text(context.localizedString.step2, style: getStepperStyle(2)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: AppAssets.svg.icRightArrow
                  .svg( width: 14, height: 14),
            ),
            Text(
              context.localizedString.step3,
              style: getStepperStyle(3),
            ),
          ],
        )
      ],
    );
  }

  TextStyle getStepperStyle(int stepper) {
    if (stepper == currentStep) {
      return AppTextStyles.style10W400Grey(
          color: AppColors.onboardingStepperSelectedColor);
    } else {
      return AppTextStyles.style10W400Grey(
          color: AppColors.onboardingStepperUnselectedColor);
    }
  }
}
