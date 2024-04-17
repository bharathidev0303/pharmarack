import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/overlay_widget.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

/// Popup that provides "Change Distributor" and "Delete Item" options to the Cart items.
class CartItemOptionsPopup extends StatefulWidget {
  final VoidCallback onClickChangeDistributor;
  final VoidCallback onClickDeleteItem;
  final Key? keyOverlayWidget;

  const CartItemOptionsPopup({
    super.key,
    this.keyOverlayWidget,
    required this.onClickChangeDistributor,
    required this.onClickDeleteItem,
  });

  @override
  State<CartItemOptionsPopup> createState() => _CartItemOptionsPopupState();
}

class _CartItemOptionsPopupState extends State<CartItemOptionsPopup> {
  final controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return OverlayWidget(
      targetAnchor: Alignment.bottomCenter,
      followerAnchor: Alignment.topRight,
      childAlignment: Alignment.topRight,
      overlayWidget: _WrapAll(
        key: widget.keyOverlayWidget,
        child: _CartOptions(
          onClickChangeDistributor: () {
            widget.onClickChangeDistributor();
            _hidePopup();
          },
          onClickDeleteItem: () {
            widget.onClickDeleteItem();
            _hidePopup();
          },
        ),
      ),
      controller: controller,
      child: AppAssets.svg.icMoreHorizontal.svg(
        width: 20,
        height: 20,
      ),
    );
  }

  void _hidePopup() {
    controller.hide();
  }
}

/// Wraps the widget in horizontal and vertical directions
class _WrapAll extends StatelessWidget {
  final Widget child;

  const _WrapAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Wrap(
          direction: Axis.vertical,
          children: [child],
        )
      ],
    );
  }
}

class _CartOptions extends StatelessWidget {
  final VoidCallback onClickChangeDistributor;
  final VoidCallback onClickDeleteItem;

  const _CartOptions({
    required this.onClickChangeDistributor,
    required this.onClickDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: context.colors.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onClickChangeDistributor,
              child: Row(
                children: [
                  AppAssets.svg.icArrowReload.svg(
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    context.localizedString.changeDistributor,
                    style: context.textStyles.paragraph2Medium?.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: onClickDeleteItem,
              child: Row(
                children: [
                  AppAssets.svg.icTrash.svg(
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    context.localizedString.deleteItem,
                    style: context.textStyles.paragraph2Medium?.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
