
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/display_order_detail.dart';

class InvoicedListItem extends StatelessWidget {
  final InvoicedItems order;

  const InvoicedListItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final freeValue = order.free == 0 || order.free == null
        ? ""
        : " + ${order.free?.toString() ?? ""}";
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                order.productFullName ?? "",
                style: context.textStyles.paragraph1Regular?.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              "₹ ${order.orderAmount?.toString() ?? ""}",
              style: context.textStyles.header7Medium?.copyWith(
                color: context.colors.textPrimary,
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvoicedRichText(
              first: context.localizedString.ptr,
              second: "₹ ${order.ptr?.toString() ?? ""}",
            ),
            const SizedBox(width: 10),
            InvoicedRichText(
              first: context.localizedString.mrp,
              second: "₹ ${order.mrp?.toString() ?? ""}",
            ),
            const SizedBox(width: 10),
            InvoicedRichText(
              first: context.localizedString.qty,
              second: "${order.quantity?.toString() ?? ""}$freeValue",
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class InvoicedRichText extends StatelessWidget {
  final String first;
  final String second;

  const InvoicedRichText({
    super.key,
    required this.first,
    required this.second,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$first: ",
            style: context.textStyles.header10Regular?.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          TextSpan(
            text: second,
            style: context.textStyles.button3?.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
