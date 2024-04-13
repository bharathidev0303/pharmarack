import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/features/cart/presentation/pages/draggable_cart/widgets/cart_product_list_item.dart';

class CartDistributorListItem extends StatelessWidget {
  final Store stores;

  const CartDistributorListItem({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stores.storeName,
                style: AppTextStyles.searchFilterTitleStyleW300
                    .copyWith(color: AppColors.secondaryTextColor),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${context.localizedString.total}: ',
                        style: AppTextStyles.style12W700Black(
                          color: AppColors.secondaryTextColor,
                        )),
                    TextSpan(
                        text: '₹ ${stores.total.toStringAsFixed(2)}',
                        style:
                            AppTextStyles.searchFilterTitleStyleW300.copyWith(
                          color: AppColors.blackTextColor,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Column(
              children: [
                CartProductListItem(
                  productName: context.localizedString.product,
                  quantity: context.localizedString.qty,
                  price: context.localizedString.price,
                  isClose: false,
                  textColor: AppColors.secondaryTextColor,
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: stores.cartItemList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 12 : 0),
                      child: CartProductListItem(
                        productName: stores.cartItemList[index].productName!,
                        quantity: '${stores.cartItemList[index].quantity!}',
                        price:
                            '₹ ${stores.cartItemList[index].productWiseAmount?.toStringAsFixed(2)}',
                        productId: '${stores.cartItemList[index].productCode}',
                        storeId: '${stores.storeId}',
                        scheme: stores.cartItemList[index].scheme,
                        style: AppTextStyles.style12W700Black(),
                      ),
                    );
                  },
                ),
              ],
            )),
      ],
    );
  }
}
