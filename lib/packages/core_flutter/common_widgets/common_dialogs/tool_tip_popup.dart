import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ToolTipPopup extends StatelessWidget {
  final Widget child;
  final Widget content;
  final TooltipDirection tooltipDirection = TooltipDirection.up;

  const ToolTipPopup(this.child, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SuperTooltipController();
    return SuperTooltip(
      hasShadow: false,
      controller: controller,
      popupDirection: tooltipDirection,
      backgroundColor: AppColors.white,
      //left: 150,
      //right: 50,
      arrowTipDistance: 5.0,
      arrowBaseWidth: 10.0,
      arrowLength: 6.0,
      borderWidth: 1.0,
      borderColor: AppColors.dividerColor,
      constraints: const BoxConstraints(
        minHeight: 0.0,
        maxHeight: 100,
        minWidth: 0.0,
        maxWidth: 100,
      ),
      showCloseButton: ShowCloseButton.none,
      showBarrier: true,
      barrierColor: Colors.transparent,
      content: content,
      child: child,
    );
  }
}
