import 'package:flutter/material.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class LoginCreateAccountWidget extends StatelessWidget {
  const LoginCreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.localizedString.onboardingLoginNewUser,
          style: AppTextStyles.textFieldNameStyle11W500,
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RoutePaths.retailerRegistration);
          },
          child: Text(
            context.localizedString.onboardingLoginCreateAccount,
            style: AppTextStyles.textFieldNameStyle11W500
                .copyWith(color: AppColors.blueButtonColor),
          ),
        )
      ],
    );
  }
}
