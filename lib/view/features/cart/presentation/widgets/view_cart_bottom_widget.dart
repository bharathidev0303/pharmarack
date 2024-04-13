import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class ViewCartBottomWidget extends StatelessWidget {
  final TextSpan? offerText;
  final int itemsCount;
  final int distributorCount;
  final double cartValue;
  final Function()? onButtonClick;

  const ViewCartBottomWidget(
      {required this.itemsCount,
      required this.distributorCount,
      required this.cartValue,
      this.onButtonClick,
      this.offerText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        offerText != null
            ? Container(
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: AppColors.offerBottomStripColor),
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
                child: Text.rich(offerText ?? const TextSpan()),
              )
            : const SizedBox.shrink(),
        Container(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
          decoration:
              const BoxDecoration(color: AppColors.cartOrderBottomPanelColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '${context.localizedString.items}: ',
                            style: AppTextStyles.textBottomSheetLabel14W400),
                        TextSpan(
                            text: '$itemsCount',
                            style: AppTextStyles.textBottomSheetValue14W500),
                      ],
                    ),
                  ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                          text: '${context.localizedString.distributor}: ',
                          style: AppTextStyles.textBottomSheetLabel14W400),
                      TextSpan(
                          text: '$distributorCount',
                          style: AppTextStyles.textBottomSheetValue14W500),
                    ],
                  )),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                          text: '${context.localizedString.cartValue}: ',
                          style: AppTextStyles.textBottomSheetLabel14W400),
                      TextSpan(
                        text: '₹ ${cartValue.toStringAsFixed(2)}',
                        style: AppTextStyles.textBottomSheetValue14W500,
                      ),
                    ],
                  )),
                ],
              )),
              PrimaryButton(
                text: context.localizedString.placeOrder.toUpperCase(),
                width: 135,
                color:
                    itemsCount == 0 ? AppColors.blueButtonDisabledColor : null,
                onPressed: () {
                  if (itemsCount != 0) {
                    onButtonClick!();
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
