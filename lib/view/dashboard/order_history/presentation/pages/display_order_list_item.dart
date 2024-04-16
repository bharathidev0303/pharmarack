
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_screen_cubit.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/secondary_button.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/tool_tip_popup.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/share_util.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';

import 'package:url_launcher/url_launcher.dart';

import 'display_order_products_pager_item.dart';

class DisplayOrderListItem extends StatelessWidget {
  final DisplayOrder order;

  const DisplayOrderListItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: AppColors.borderColor),
          color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      context.localizedString.orderNumber,
                      style: AppTextStyles.textFieldNameStyle11W500,
                    ),
                    Text(
                      order.orderId.toString(),
                      style: AppTextStyles.listItemValueStyle12W500,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                      child: Text(
                        context.localizedString.orderPlacedOn,
                        style: AppTextStyles.textFieldNameStyle11W500,
                      ),
                    ),
                    Text(
                      order.orderDate,
                      style: AppTextStyles.listItemValueStyle12W500,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                      child: Text(
                        context.localizedString.distributor,
                        style: AppTextStyles.textFieldNameStyle11W500,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            order.storeName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyles.style10W500Blue(),
                          ),
                        ),
                        AppAssets.svg.blueArrowUpRight
                            .svg(package: 'core_flutter', height: 12, width: 12)
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(context.localizedString.status,
                                  style:
                                      AppTextStyles.textFieldNameStyle11W500),
                              Text(
                                order.orderStatus,
                                style:
                                    order.orderStatus.toLowerCase() == 'cancel'
                                        ? AppTextStyles.styleRed12W500
                                        : AppTextStyles.style12W500,
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final mobileNumber =
                                Uri.parse('tel:${order.mobileNumber}');
                            if (await canLaunchUrl(mobileNumber)) {
                              launchUrl(mobileNumber);
                            } else {
                              if (context.mounted) {
                                CommonDialogs.showSimpleDialog(
                                    parentContext: context,
                                    title: context
                                        .localizedString.somethingWentWrong,
                                    subTitle: context.localizedString
                                        .couldNotLaunchCall(
                                            order.mobileNumber.toString()),
                                    buttonTitle: context.localizedString.ok);
                              }
                            }
                          },
                          child: AppAssets.svg.icPhone.svg(
                              package: 'core_flutter', height: 24, width: 24),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            shareLink(order.invoiceLink);
                          },
                          child: AppAssets.svg.icShare.svg(
                              package: 'core_flutter', height: 24, width: 24),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                        child: Text(context.localizedString.totalAmount,
                            style: AppTextStyles.textFieldNameStyle11W300)),
                    Text("₹ ${order.orderAmount}",
                        style: AppTextStyles.listItemValueStyle12W500),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                      child: Text(context.localizedString.orderedItems,
                          style: AppTextStyles.textFieldNameStyle11W300),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            "${order.successfulItems}/${order.orderedQuantity}",
                            style: AppTextStyles.listItemValueStyle12W500),
                        const SizedBox(width: 4),
                        Visibility(
                          visible:
                              order.successfulItems != order.orderedQuantity,
                          child: ToolTipPopup(
                              AppAssets.svg.icInfoCircle.svg(
                                package: 'core_flutter',
                                height: 12,
                                width: 12,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.red600, BlendMode.srcIn),
                              ),
                              SizedBox(
                                height: 80,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        context.localizedString.successfulItems,
                                        style: AppTextStyles
                                            .textFieldNameStyle11W300),
                                    const SizedBox(height: 5),
                                    Text(order.successfulItems.toString(),
                                        style: AppTextStyles
                                            .listItemValueStyle12W500),
                                    const SizedBox(height: 5),
                                    Text(context.localizedString.failedItems,
                                        style: AppTextStyles
                                            .textFieldNameStyle11W300),
                                    const SizedBox(height: 5),
                                    Text(
                                        (order.orderedQuantity -
                                                order.successfulItems)
                                            .toString(),
                                        style: AppTextStyles.style12W500Black(
                                            color: AppColors.redErrorColor)),
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Text(context.localizedString.products,
              style: AppTextStyles.textFieldNameStyle11W300),
          ProductListWidget(order.products),
          const SizedBox(height: 5.0),
          SizedBox(
            width: double.infinity,
            child: SecondaryButton(
              text: context.localizedString.orderDetails.toUpperCase(),
              onClick: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.orderHistoryDetail,
                  arguments: order,
                );
              },
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Expanded(
                child: Text(context.localizedString.rateYourExperience,
                    style: AppTextStyles.listItemSecondaryTextStyleInter10W600),
              ),
              RatingBar.builder(
                minRating: 1,
                itemCount: 5,
                itemSize: 18.0,
                initialRating: order.rating,
                glow: false,
                unratedColor: AppColors.ratingStarUnSelectedColor,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: AppColors.secondaryColor,
                ),
                onRatingUpdate: (rating) {
                  getIt<FeedbackScreenCubit>().saveFeedback(
                    feedbackType: "Order",
                    rating: rating,
                    storeId: order.storeId,
                    remarks: "NA",
                    feedbackTo: order.orderId.toInt().toString(),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
