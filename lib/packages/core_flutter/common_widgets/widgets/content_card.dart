import 'package:flutter/material.dart';

import '../../dls/color/app_colors.dart';

/// A content card which has a white background and a border with a radius of 10
class ContentCard extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const ContentCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
