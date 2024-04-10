import 'package:flutter/material.dart';

/// A widget to display an floating overlay widget when tapped on the child widget.
/// Floating overlay widget will be dismissed when tapped on outside area.
class OverlayWidget extends StatefulWidget {
  /// The default visible widget.
  /// Overlay will be anchored to this widget using [targetAnchor]. see [overlayBuilder]
  final Widget child;

  /// The widget to be shown as an overlay.
  /// This widget will be anchored to [child] using [followerAnchor]
  final Widget overlayWidget;

  /// The anchor point of the [child] widget that [followerAnchor] lines up with.
  final Alignment targetAnchor;

  /// The anchor point of the overlay widget that [targetAnchor] lines up with.
  final Alignment followerAnchor;

  /// The [child] widget alignment.
  final Alignment childAlignment;

  /// Controller for managing and reading the state of the Overlay.
  final OverlayPortalController controller;

  OverlayWidget({
    super.key,
    required this.child,
    required this.overlayWidget,
    this.targetAnchor = Alignment.bottomCenter,
    this.followerAnchor = Alignment.topCenter,
    this.childAlignment = Alignment.topCenter,
    OverlayPortalController? controller,
  }) : controller = controller ?? OverlayPortalController();

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  final _layerLink = LayerLink();
  final _keyOverlayWidget = GlobalKey(debugLabel: 'overlayWidgetKey');

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: OverlayPortal(
        controller: widget.controller,
        overlayChildBuilder: (BuildContext context) {
          /// This overlay-child takes all the available space by default,
          ///   but we use Align widget to position the overlay widget at specific location
          ///
          /// GestureDetector is used to capture the tap event and hide the overlay-widget when clicked on outside area.
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapDown: (details) {
              final box = _keyOverlayWidget.currentContext?.findRenderObject()
                  as RenderBox?;
              if (box == null) return;
              final offset = box.localToGlobal(Offset.zero);
              final clickOffset = details.globalPosition;
              final overlayWidgetClicked = clickOffset.dx >= offset.dx &&
                  clickOffset.dx <= offset.dx + box.size.width &&
                  clickOffset.dy >= offset.dy &&
                  clickOffset.dy <= offset.dy + box.size.height;
              if (!overlayWidgetClicked && widget.controller.isShowing) {
                widget.controller.hide();
              }
            },
            child: CompositedTransformFollower(
              link: _layerLink,
              targetAnchor: widget.targetAnchor,
              followerAnchor: widget.followerAnchor,
              child: Align(
                alignment: widget.childAlignment,
                child: SizedBox(
                  key: _keyOverlayWidget,
                  child: widget.overlayWidget,
                ),
              ),
            ),
          );
        },
        child: GestureDetector(
          onTap: () => widget.controller.toggle(),
          child: widget.child,
        ),
      ),
    );
  }
}
