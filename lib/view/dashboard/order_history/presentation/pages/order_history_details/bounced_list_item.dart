
import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/display_order_detail.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_details/invoiced_list_item.dart';
import 'package:pharmarack/view/features/change_distributor/presentation/widget/change_distributor_dialog_card.dart';

class BouncedListItem extends StatelessWidget {
  final BouncedItems bouncedItem;
  final DisplayOrder order;

  const BouncedListItem({
    super.key,
    required this.bouncedItem,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                bouncedItem.storeProductName ?? "",
                style: context.textStyles.paragraph1Regular?.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            Text(
              "₹ ${bouncedItem.productWiseAmount ?? ""}",
              style: context.textStyles.paragraph1Regular?.copyWith(
                color: context.colors.textPrimary?.withOpacity(0.30),
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: bouncedItem.companyName?.isNotEmpty ?? false,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Company Name",
                                  style: context.textStyles.header9Regular
                                      ?.copyWith(color: context.colors.primary),
                                ),
                                WidgetSpan(
                                  child: AppAssets.svg.blueArrowUpRight.svg(
                                    alignment: Alignment.centerLeft,
                                    package: 'core_flutter',
                                    height: 12,
                                    width: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: bouncedItem.companyName?.isNotEmpty ?? false,
                          child: const SizedBox(width: 16),
                        ),
                        Visibility(
                          visible: bouncedItem.storeName?.isNotEmpty ?? false,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: bouncedItem.storeName ?? "",
                                  style: context.textStyles.header9Regular
                                      ?.copyWith(color: context.colors.primary),
                                ),
                                WidgetSpan(
                                  child: AppAssets.svg.blueArrowUpRight.svg(
                                    alignment: Alignment.centerLeft,
                                    package: 'core_flutter',
                                    height: 12,
                                    width: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InvoicedRichText(
                        first: context.localizedString.ptr,
                        second: "₹ ${bouncedItem.ptr?.toString() ?? ""}",
                      ),
                      const SizedBox(width: 10),
                      InvoicedRichText(
                        first: context.localizedString.mrp,
                        second: "₹ ${bouncedItem.mrp?.toString() ?? ""}",
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${context.localizedString.qty}: ",
                        style: context.textStyles.header10Regular?.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      Text(
                        "${bouncedItem.receivedQuantity}/${bouncedItem.bouncedQuantity} ${context.localizedString.unfulfilled}",
                        style: context.textStyles.button3?.copyWith(
                          color: context.colors.error,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (_) {
                    return ChangeDistributorDialogCard(
                      productCode: bouncedItem.productCode ?? "",
                      storeId: bouncedItem.storeid ?? -1,
                    );
                  },
                );
                LogUtil.info('Change distributor dialog closed');
                // getIt<CartScreenCubit>().refreshScreenData();
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: context.colors.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: AppAssets.svg.icRefresh.svg(
                  package: "core_flutter",
                  width: 16,
                  height: 16,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
