import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBlurView extends StatelessWidget {
  final Widget child;
  final bool isBlur;
  final Function()? onTap;
  const CustomBlurView(
      {super.key, required this.child, required this.isBlur, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isBlur
            ? InkWell(
                onTap: () {
                  onTap?.call();
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.5), // Adjust the opacity
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
