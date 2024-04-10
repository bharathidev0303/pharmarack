
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final List<Widget>? actions;
  final VoidCallback? onPressBackButton;
  final bool shouldHideBack;

  const SecondaryAppBar({
    super.key,
    required this.titleText,
    this.actions,
    this.onPressBackButton,
    this.shouldHideBack = false,
  });

  @override
  Widget build(BuildContext context) {
    final title = Text(
      titleText,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 1,
      textAlign: TextAlign.start,
      style: AppTextStyles.style14W500Black().copyWith(
        fontSize: 18,
      ),
    );
    return AppBar(
      title: title,
      titleSpacing: (shouldHideBack ? 16 : 0),
      centerTitle: false,
      actions: [...(actions ?? []), const SizedBox(width: 15.0)],
      elevation: 0,
      backgroundColor: AppColors.appBarColor,
      surfaceTintColor: AppColors.appBarColor,
      leadingWidth: 50,
      // 16 + 24 + 10
      leading: shouldHideBack
          ? null
          : InkWell(
              onTap: () {
                if (onPressBackButton != null) {
                  onPressBackButton!();
                } else if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 10),
                child: AppAssets.svg.icBackArrow.svg(
                  width: 24,
                  height: 24,
                  
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(61);
}
