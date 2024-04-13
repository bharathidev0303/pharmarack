import 'package:flutter/material.dart';

class AnchorWidget extends StatefulWidget {
  const AnchorWidget({
    super.key,
    this.width,
    this.onTap,
    this.child,
    required this.overlayPortalController,
  });

  final double? width;

  final VoidCallback? onTap;

  final Widget? child;

  final OverlayPortalController overlayPortalController;

  @override
  State<AnchorWidget> createState() => _AnchorWidgetState();
}

class _AnchorWidgetState extends State<AnchorWidget> {
  bool isShowing = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isShowing ? const Color(0xFFD4D4D4) : Colors.white,
      child: InkWell(
        onTap: () {
          widget.onTap?.call();
          setState(() {
            isShowing = widget.overlayPortalController.isShowing;
          });
        },
        child: widget.child ?? const SizedBox(),
      ),
    );
  }
}
