
import 'package:flutter/material.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/navigation/onboarding_outer_route_paths.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';


class LandingScreenMobileView extends StatelessWidget {
  const LandingScreenMobileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: AppColors.onboardingPageBackgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: AppAssets.png.prNewLogo
                      .image(width: 144, height: 66),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.onboardingCardBackgroundColor,
                        border: Border.all(
                          color: AppColors.onboardingCardBorderColor,
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child:
                              AppAssets.png.registrationLandingPageImage.image(
                            
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 24),
                          child: Column(
                            children: [
                              Text(
                                context.localizedString.welcomeToPr,
                                style: AppTextStyles.style20BoldBlack(),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                context.localizedString.welcomeMessage,
                                style: AppTextStyles.searchHintTextStyle11W400(
                                    color: context.colors.textSecondary),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 100,
            color: AppColors.onboardingPageBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  OnboardingCommonButton(
                      buttonText: context.localizedString.start.toUpperCase(),
                      buttonBackgroundColor: AppColors.blueButtonColor,
                      onPressedCallback: () {
                        Navigator.pushNamed(
                            context,
                            onboardingDI<RoutePaths>()
                                .getRetailerRegistrationStepOnePath());
                      }),
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          context.localizedString.back.toUpperCase(),
                          style: AppTextStyles.blueLinkTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
