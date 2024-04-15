
import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/utils/retailer_utils.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/cubit/draggable_cart/cubit/draggable_cart_cubit.dart';




class CartProductListItem extends StatelessWidget {
  final String productName;
  final String quantity;
  final String price;
  final bool isClose;
  final Color textColor;
  final String? storeId;
  final String? productId;
  final String? scheme;
  final TextStyle? style;

  const CartProductListItem(
      {required this.productName,
      required this.quantity,
      required this.price,
      this.textColor = AppColors.cardTitleColor,
      this.isClose = true,
      this.scheme,
      this.productId,
      this.storeId,
      this.style,
      super.key});

  @override
  Widget build(BuildContext context) {
    final draggableCubit = getIt<DraggableCartScreenCubit>();
    var quantityText = '';
    if (quantity == "Qty") {
      quantityText = quantity;
    } else {
      final calculatedScheme = RetailerUtils.getFreeTabletsCountAsPerScheme(
          scheme, int.parse(quantity));
      quantityText = '$quantity+$calculatedScheme';
    }

    return Row(
      children: [
        Expanded(
            flex: 6,
            child: Text(
              productName,
              overflow: TextOverflow.ellipsis,
              style: style ??
                  AppTextStyles.style12W500Black(
                      color: textColor, weight: FontWeight.w400),
            )),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 2,
            child: Text(
              quantityText,
              style: style ??
                  AppTextStyles.style12W500Black(
                      color: textColor, weight: FontWeight.w400),
            )),
        Expanded(
            flex: 2,
            child: Text(
              price,
              overflow: TextOverflow.ellipsis,
              style: style ??
                  AppTextStyles.style12W500Black(
                      color: textColor, weight: FontWeight.w400),
            )),
        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if (productId != null && storeId != null) {
                  draggableCubit.deleteProductFromCart(storeId!, productId!);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: isClose
                    ? AppAssets.svg.cartClose
                        .svg(width: 12, height: 12, package: 'core_flutter')
                    : const SizedBox.shrink(),
              ),
            )),
      ],
    );
  }
}
