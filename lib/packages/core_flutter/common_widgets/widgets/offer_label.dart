import 'package:flutter/cupertino.dart';

import '../../dls/color/app_colors.dart';
import '../../dls/text_utils/app_text_style.dart';

class OfferLabel extends StatelessWidget {
  final String offerLabel;

  const OfferLabel({required this.offerLabel, super.key});

  @override
  Widget build(BuildContext context) {
    if (offerLabel.isNotEmpty) {
      return Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryOrangeColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3), bottomLeft: Radius.circular(3))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
          child: Text(
            offerLabel,
            style: AppTextStyles.style10W500Black(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
