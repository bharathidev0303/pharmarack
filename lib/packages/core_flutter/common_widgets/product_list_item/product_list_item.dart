import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/plus_button.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/product_list_item/product_list_item_cubit.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/title_and_value_row_item.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

import '../../utils/extensions.dart';

class ProductListItem extends StatelessWidget {
  final String? productName;
  final double? mrp;
  final int? qty;
  final String? storeName;
  final String? company;
  final double? ptr;
  final int? stock;
  final double? margin;
  final double? storeProductGST;
  final String? expiryDate;
  final String? scheme;
  final String? cashbackMessage;
  final int? index;
  final int? existingQty;
  final String? packing;
  final String? rStockVisibility;

  final Function()? plusButtonTapped;

  const ProductListItem(
      {super.key,
      this.productName,
      this.mrp,
      this.qty,
      this.storeName,
      this.company,
      this.ptr,
      this.stock,
      this.margin,
      this.storeProductGST,
      this.expiryDate,
      this.scheme,
      this.cashbackMessage,
      this.index,
      this.plusButtonTapped,
      this.existingQty,
      this.packing,
      this.rStockVisibility});

  @override
  Widget build(BuildContext context) {
    bool? isSponsored;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, right: 10, left: 10),
          child: _buildProductItem(isSponsored ?? false, context),
        ),
        _buildCashBack(context)
      ],
    );
  }

  _buildProductItem(bool isSponsored, BuildContext context) {
    bool arrowState = false;
    return BlocProvider(
      create: (context) => ProductListItemCubit(),
      child: BlocBuilder<ProductListItemCubit, ProductListItemState>(
        builder: (BuildContext context, state) {
          if (state is ArrowTapped) {
            arrowState = state.isTapped;
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    productName != null && productName != ''
                        ? Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    productName ?? '',
                                    style: AppTextStyles.style12W700Black(
                                        fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                arrowState
                                    ? GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<ProductListItemCubit>(
                                                  context)
                                              .arrowTapped(false);
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 25,
                                          padding: const EdgeInsets.only(
                                              top: 1,
                                              bottom: 1,
                                              left: 1,
                                              right: 8),
                                          child: AppAssets.svg.arrowUp.svg(
                                              package: 'core_flutter',
                                              height: 19,
                                              width: 19),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<ProductListItemCubit>(
                                                  context)
                                              .arrowTapped(true);
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 25,
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 5,
                                              right: 15),
                                          child: AppAssets.svg.arrowDown.svg(
                                              package: 'core_flutter',
                                              height: 10,
                                              width: 10),
                                        ),
                                      ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                    _buildScheme(context),
                    index == 0
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 5, left: 2),
                            child: Row(
                              children: [
                                Text(
                                  context.localizedString.sponsored,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppTextStyles.searchFilterTitleStyleW300,
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                AppAssets.svg.infoCircle
                                    .svg(package: 'core_flutter')
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.73,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                company != null && company != ''
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                                minWidth: 30,
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3),
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                            ),
                                            child: Text(
                                              company?.trim() ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppTextStyles
                                                  .style12W700Black(
                                                      color: AppColors
                                                          .dashboardSubTitleColor),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: AppAssets
                                                .svg.blueArrowUpRight
                                                .svg(
                                                    package: 'core_flutter',
                                                    height: 12,
                                                    width: 12),
                                          )
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                                company != null && company != ''
                                    ? const SizedBox(
                                        width: 16,
                                      )
                                    : const SizedBox.shrink(),
                                storeName != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                            ),
                                            constraints: BoxConstraints(
                                                minWidth: 30,
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3),
                                            child: Text(
                                              storeName!.trim(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppTextStyles
                                                  .style12W700Black(
                                                      color: AppColors
                                                          .dashboardSubTitleColor),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: AppAssets
                                                .svg.blueArrowUpRight
                                                .svg(
                                                    package: 'core_flutter',
                                                    height: 12,
                                                    width: 12),
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                              ]),
                        ),
                        const SizedBox(height: 10),
                        // PurchaseDetailsRow(
                        //   ptr: ptr,
                        //   mrp: mrp,
                        //   stockQuantity: stock,
                        //   rStockVisibility: rStockVisibility,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 10.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       TitleAndAmountRowItem(
                        //           title: context.localizedString.ptr,
                        //           value: ptr.toString(),
                        //           textType: ValueTextType.currency),
                        //       const SizedBox(
                        //         width: 10,
                        //       ),
                        //       TitleAndAmountRowItem(
                        //         title: context.localizedString.mrp,
                        //         value: mrp.toString(),
                        //         textType: ValueTextType.currency,
                        //       ),
                        //       const SizedBox(
                        //         width: 10,
                        //       ),
                        //       TitleAndAmountRowItem(
                        //         title: context.localizedString.stockValue,
                        //         value: stock.toString(),
                        //         textColor: stock == 0
                        //             ? AppColors.redErrorColor
                        //             : stock! > 10
                        //                 ? AppColors.primaryGreenColor
                        //                 : AppColors.primaryColor,
                        //       ),
                        //       const SizedBox(
                        //         width: 10,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        arrowState
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    expiryDate != null && expiryDate != ''
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: TitleAndAmountRowItem(
                                                title: context
                                                    .localizedString.expiry,
                                                value: expiryDate ?? ""),
                                          )
                                        : const SizedBox.shrink(),
                                    storeProductGST != null &&
                                            storeProductGST != 0.0
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: TitleAndAmountRowItem(
                                                title:
                                                    context.localizedString.gst,
                                                value:
                                                    storeProductGST.toString(),
                                                textType:
                                                    ValueTextType.percentage),
                                          )
                                        : const SizedBox.shrink(),
                                    margin != null
                                        ? TitleAndAmountRowItem(
                                            title:
                                                context.localizedString.margin,
                                            value: margin.toString(),
                                            textType: ValueTextType.percentage)
                                        : const SizedBox.shrink(),
                                    packing != null
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: TitleAndAmountRowItem(
                                              title:
                                                  context.localizedString.pack,
                                              value: packing!,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    PlusButton(onTap: () {
                      plusButtonTapped?.call();
                    }),
                  ],
                ),
              ]);
        },
      ),
    );
  }

  _buildScheme(BuildContext context) {
    if (scheme != null && scheme != '') {
      if (scheme!.contains(',')) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: _buildMultipleOfferWidget(context),
        );
      } else {
        return index != 0
            ? _buildOfferWidget(inputScheme: scheme, context: context)
            : Container();
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  _buildOfferWidget(
      {String? inputScheme,
      double? rightMargin,
      required BuildContext context}) {
    return inputScheme != null && inputScheme != ''
        ? Container(
            margin: EdgeInsets.only(right: rightMargin ?? 0.0),
            height: 20,
            decoration: const BoxDecoration(
                color: AppColors.primaryOrangeColor,
                borderRadius: BorderRadius.all(Radius.circular(3))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  inputScheme,
                  style: AppTextStyles.style10W500Orange(color: Colors.white),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  _buildMultipleOfferWidget(BuildContext context) {
    final schemeList = scheme!.split(",");
    final offer = schemeList[0];
    final multipleOffer = schemeList.length - 1;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildOfferWidget(inputScheme: offer, rightMargin: 5, context: context),
        multipleOffer != 0
            ? Text(
                context.localizedString.plusOffers(multipleOffer),
                style: AppTextStyles.style10W500Orange(),
              )
            : const SizedBox()
      ],
    );
  }

  _buildCashBack(BuildContext context) {
    return cashbackMessage != null && cashbackMessage != ''
        ? Container(
            padding: const EdgeInsets.only(top: 5),
            height: 22,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.secondaryOrangeColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                formatHtmlString(cashbackMessage ?? ''),
                style: AppTextStyles.style10W400White(
                    color: AppColors.primaryOrangeColor),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
