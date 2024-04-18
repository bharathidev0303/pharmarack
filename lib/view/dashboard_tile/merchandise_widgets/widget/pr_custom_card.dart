
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dimensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/widget/pr_positioned_button.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/widget/pr_positioned_text.dart';

class PRCustomCard extends StatelessWidget {
  final String customText;
  final String image;
  final String buttonText;
  final Function onItemTap;
  final Function buttonPressed;
  final Function customTextPressed;
  const PRCustomCard(
      {super.key,
      required this.image,
      required this.customText,
      required this.buttonText,
      required this.onItemTap,
      required this.buttonPressed,
      required this.customTextPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.circularRadius10),
      child: Stack(children: [
        InkWell(
            onTap: () => onItemTap.call(),
            child: Image.asset(
              image,
              width: double.maxFinite,
              fit: BoxFit.contain,
            )),
        PRPositionedButton(
          onPressed: () => buttonPressed.call(),
          text: buttonText,
          minWidth: kIsWeb ? 213 : 90,
          height: kIsWeb ? 50 : 25,
          textColor: AppColors.grey93,
          fontSize: kIsWeb ? 20 : 10,
          leftPosition: kIsWeb ? 32 : 10,
          bottomPosition: kIsWeb ? 32 : 10,
          backgroundColor: AppColors.buttonBlue,
        ),
        PRPositionedText(
          onPressed: () => customTextPressed.call(),
          text: customText,
          fontSize: kIsWeb ? 36 : 15,
          textColor: kIsWeb
              ? context.colors.textPrimary!
              : context.colors.textSecondary!,
          leftPosition: kIsWeb ? 32 : 10,
          topPosition: kIsWeb ? 32 : 10,
        ),
      ]),
    );
  }
}
