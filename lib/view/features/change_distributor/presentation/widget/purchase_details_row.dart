import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

import 'offer_text.dart';

class PurchaseDetailsRow extends StatelessWidget {
  final double? ptr;
  final double? mrp;
  final int? stockQuantity;
  final String? scheme;
  final int? rStockVisibility;
  final int? isShowNonMappedOrderStock;

  const PurchaseDetailsRow({
    super.key,
    required this.ptr,
    required this.mrp,
    required this.stockQuantity,
    this.scheme,
    this.rStockVisibility,
    this.isShowNonMappedOrderStock,
  });

  String _getPriceValue(double? value) {
    if (value == null || value == 0) {
      return '-';
    }
    return '₹ $value';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: '${context.localizedString.ptr}: ',
            style: AppTextStyles.style12W700Black(
              color: AppColors.lightGrey,
            ),
            children: [
              TextSpan(
                text: _getPriceValue(ptr),
                style: AppTextStyles.style11W500MedGrey(
                  color: AppColors.primaryTextColor,
                ).copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: '${context.localizedString.mrp}: ',
            style: AppTextStyles.style12W700Black(
              color: AppColors.lightGrey,
            ),
            children: [
              TextSpan(
                text: _getPriceValue(mrp),
                style: AppTextStyles.style11W500MedGrey(
                  color: AppColors.primaryTextColor,
                ).copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: '${context.localizedString.stock}: ',
            style: AppTextStyles.style12W700Black(
              color: (rStockVisibility != null && rStockVisibility == 1) ||
                      (isShowNonMappedOrderStock != null &&
                          isShowNonMappedOrderStock == 1)
                  ? AppColors.lightGrey
                  : stockQuantity == 0
                      ? AppColors.redErrorColor
                      : stockQuantity! > 10
                          ? AppColors.primaryGreenColor
                          : AppColors.primaryColor,
            ),
            children: [
              TextSpan(
                text: (rStockVisibility != null && rStockVisibility == 1) ||
                        (isShowNonMappedOrderStock != null &&
                            isShowNonMappedOrderStock == 1)
                    ? 'NA'
                    : stockQuantity?.toString(),
                style: AppTextStyles.style11W500MedGrey(
                  color: (rStockVisibility != null && rStockVisibility == 1) ||
                          (isShowNonMappedOrderStock != null &&
                              isShowNonMappedOrderStock == 1)
                      ? AppColors.primaryTextColor
                      : stockQuantity == 0
                          ? AppColors.redErrorColor
                          : stockQuantity! > 10
                              ? AppColors.primaryGreenColor
                              : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        /* scheme != null && scheme!.isNotEmpty
            ?*/
        OfferText(
          name: '${context.localizedString.scheme}:',
          value:
              scheme != null && scheme!.isNotEmpty ? scheme!.split(',')[0] : '',
        )
/*
            : const SizedBox.shrink(),
*/
      ],
    );
  }
}
