import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/tool_tip_popup.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_detail_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_details/bounced_list_item.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_details/invoiced_list_item.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_details/reorder_confirmation_dialog.dart';

class OrderDetailMobileContent extends StatelessWidget {
  final DisplayOrder order;
  final DisplayOrderDetailModel? displayOrderDetailModel;

  const OrderDetailMobileContent({
    super.key,
    required this.order,
    required this.displayOrderDetailModel,
  });

  @override
  Widget build(BuildContext context) {
    final orders = displayOrderDetailModel?.invoicedItems ?? [];
    final bouncedOrders = displayOrderDetailModel?.bouncedItems ?? [];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                context.localizedString.summaryTitle,
                style: AppTextStyles.listItemValueStyle12W500.copyWith(
                  color: AppColors.pageTitleColor,
                ),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1, color: AppColors.borderColor),
                color: AppColors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localizedString.status,
                            style: AppTextStyles.textFieldNameStyle11W500,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            order.orderStatus,
                            style: order.orderStatus.toLowerCase() == 'cancel'
                                ? AppTextStyles.styleRed12W500
                                : AppTextStyles.style12W500,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            context.localizedString.distributor,
                            style: AppTextStyles.textFieldNameStyle11W500,
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: order.storeName,
                                  style: AppTextStyles.style10W500Blue(),
                                ),
                                WidgetSpan(
                                  child: AppAssets.svg.blueArrowUpRight.svg(
                                    alignment: Alignment.centerLeft,
                                    height: 12,
                                    width: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            order.mobileNumber ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyles.style10W500Blue(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.localizedString.orderedItems,
                          style: AppTextStyles.textFieldNameStyle11W500,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${order.successfulItems}/${order.orderedQuantity}",
                              style: AppTextStyles.listItemValueStyle12W500,
                            ),
                            const SizedBox(width: 4),
                            Visibility(
                              visible: order.successfulItems !=
                                  order.orderedQuantity,
                              child: ToolTipPopup(
                                AppAssets.svg.icInfoCircle.svg(
                                  height: 12,
                                  width: 12,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.red600, BlendMode.srcIn),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          context
                                              .localizedString.successfulItems,
                                          style: AppTextStyles
                                              .textFieldNameStyle11W500),
                                      const SizedBox(height: 5),
                                      Text(order.successfulItems.toString(),
                                          style: AppTextStyles
                                              .listItemValueStyle12W500),
                                      const SizedBox(height: 5),
                                      Text(context.localizedString.failedItems,
                                          style: AppTextStyles
                                              .textFieldNameStyle11W500),
                                      const SizedBox(height: 5),
                                      Text(
                                          (order.orderedQuantity -
                                                  order.successfulItems)
                                              .toString(),
                                          style: AppTextStyles.style12W500Black(
                                              color: AppColors.redErrorColor)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.localizedString.orderPlacedOn,
                          style: AppTextStyles.textFieldNameStyle11W500,
                        ),
                        Text(
                          order.orderDate,
                          style: AppTextStyles.listItemValueStyle12W500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverVisibility(
            visible: orders.isNotEmpty,
            sliver: const SliverPadding(padding: EdgeInsets.only(top: 20)),
          ),
          SliverVisibility(
            visible: orders.isNotEmpty,
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        context.localizedString.invoicedItemsTitle,
                        style: AppTextStyles.listItemValueStyle12W500.copyWith(
                          color: AppColors.pageTitleColor,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (ctx) {
                          return ReorderConfirmationDialog(
                            order: order,
                            orders: orders,
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.localizedString.reOrderItemTitle,
                          style: AppTextStyles.blueLinkTextStyle,
                        ),
                        const SizedBox(width: 5),
                        AppAssets.svg.icRefresh.svg(
                          width: 14,
                          height: 14,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverVisibility(
            visible: orders.isNotEmpty,
            sliver: const SliverPadding(padding: EdgeInsets.only(top: 10)),
          ),
          SliverVisibility(
            visible: orders.isNotEmpty,
            sliver: DecoratedSliver(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1, color: AppColors.borderColor),
                color: AppColors.white,
              ),
              sliver: SliverPadding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: orders.length,
                        itemBuilder: (ctx, index) => InvoicedListItem(
                          order: orders[index],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.dropDownDividerColor,
                      ),
                      const SizedBox(height: 11),
                      _DiscountAndTaxesApplied(
                        title: context.localizedString.discountApplied,
                        subTitle: displayOrderDetailModel?.invoiceDiscount == 0
                            ? "-₹ ${displayOrderDetailModel?.invoiceDiscount}"
                            : "₹ 0",
                      ),
                      const SizedBox(height: 6),
                      _DiscountAndTaxesApplied(
                        title: context.localizedString.taxes,
                        subTitle: "${displayOrderDetailModel?.invoiceTax ?? 0}",
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              context.localizedString.total,
                              style: context.textStyles.button1?.copyWith(
                                color: context.colors.textPrimary,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "₹ ${displayOrderDetailModel?.invoiceTotal ?? ""}",
                              style: context.textStyles.button1?.copyWith(
                                color: context.colors.textPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverVisibility(
            visible: bouncedOrders.isNotEmpty,
            sliver: const SliverPadding(padding: EdgeInsets.only(top: 20)),
          ),
          SliverVisibility(
            visible: bouncedOrders.isNotEmpty,
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  context.localizedString.bouncedItems.toUpperCase(),
                  style: context.textStyles.header8Medium?.copyWith(
                    color: AppColors.pageTitleColor,
                  ),
                ),
              ),
            ),
          ),
          SliverVisibility(
            visible: bouncedOrders.isNotEmpty,
            sliver: const SliverPadding(padding: EdgeInsets.only(top: 10)),
          ),
          SliverVisibility(
            visible: bouncedOrders.isNotEmpty,
            sliver: DecoratedSliver(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1, color: context.colors.inputField!),
                color: AppColors.white,
              ),
              sliver: SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverList.builder(
                  itemCount: bouncedOrders.length,
                  itemBuilder: (ctx, index) => BouncedListItem(
                    bouncedItem: bouncedOrders[index],
                    order: order,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DiscountAndTaxesApplied extends StatelessWidget {
  final String title;
  final String subTitle;

  const _DiscountAndTaxesApplied({
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: context.textStyles.header9Regular?.copyWith(
              color: context.colors.textSecondary,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: Text(
            subTitle,
            style: context.textStyles.paragraph2Medium?.copyWith(
              color: subTitle.startsWith("-")
                  ? AppColors.primaryOrangeColor
                  : AppColors.cardTitleColor,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
