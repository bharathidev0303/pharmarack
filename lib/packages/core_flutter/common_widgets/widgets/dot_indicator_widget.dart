import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';

class DotIndicatorWidget extends StatelessWidget {
  final Map<int, Object> entries;
  final int currentIndex;
  final CarouselController controller;

  const DotIndicatorWidget({
    super.key,
    required this.currentIndex,
    required this.entries,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: entries.entries.map((entry) {
        return GestureDetector(
          onTap: () => controller.animateToPage(entry.key),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: currentIndex == entry.key ? 15 : 5.0,
            height: 5.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                color: AppColors.dividerColor
                    .withOpacity(currentIndex == entry.key ? 0.9 : 0.4),
                borderRadius: BorderRadius.circular(5)),
          ),
        );
      }).toList(),
    );
  }
}
