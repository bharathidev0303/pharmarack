import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

import '../../dls/color/app_colors.dart';
import '../../dls/text_utils/app_text_style.dart';

class NoDataWidget extends StatelessWidget {
  final String? message;

  const NoDataWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message ?? context.localizedString.noDataFound,
      style: AppTextStyles.style14W400.copyWith(
        color: AppColors.primaryTextColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
