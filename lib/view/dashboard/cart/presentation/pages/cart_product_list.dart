import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/custom_expandable_tile.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/offer_label.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/primary_check_box.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/cart/data/model/cart_detail.dart';
import 'package:pharmarack/view/dashboard/cart/di/cart_provider.dart';
import 'package:pharmarack/view/dashboard/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/widgets/cart_item_options_popup.dart';
import 'package:pharmarack/view/features/change_distributor/presentation/widget/change_distributor_dialog_card.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/search_product_page.dart';
import '../../../../features/change_distributor/presentation/widget/purchase_details_row.dart';
import '../cubit/cart_screen_cubit.dart';
import '../widgets/add_single_product_in_cart_popup.dart';
import '../widgets/cart_widgets.dart';

class CartProductList extends StatelessWidget {
  final List<Store> stores;

  const CartProductList({required this.stores, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 15.0),
          itemCount: stores.length,
          itemBuilder: (context, index) {
            final store = stores[index];
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: store.isStoreValid == true
                                ? AppColors.dividerColor
                                : AppColors.redErrorColor)),
                  ),
                  child: CustomExpandableTile(
                    key: ValueKey(store.isExpanded),
                    initiallyExpanded: store.isExpanded,
                    header: (bool isExpanded, Animation<double> iconTurns,
                        Animation<double> heightFactor) {
                      return _ProductListSectionHeader(
                          isExpanded,
                          store.isSelected,
                          store.storeName,
                          store.storeId,
                          store.cartItemList.length,
                          store.total);
                    },
                    childrenBody: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: store.cartItemList.length,
                        itemBuilder: (context, index) {
                          return _CartProductListItem(
                              store.cartItemList[index]);
                        }),
                    onExpansionChanged: (bool isExpanded) {
                      cartScreenCubit.onStoreItemExpanded(
                          store.storeId, isExpanded);
                    },
                  ),
                ),
                store.isStoreValid == false
                    ? Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(top: 8),
                        child: AppAssets.svg.icInfoCircleError.svg(),
                      )
                    : Container()
              ],
            );
          },
        ));
  }
}

class _ProductListSectionHeader extends StatelessWidget {
  final bool _isExpanded;
  final bool _isSelected;
  final String _distributorName;
  final int storeId;
  final int _items;
  final double _total;

  const _ProductListSectionHeader(this._isExpanded, this._isSelected,
      this._distributorName, this.storeId, this._items, this._total);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              ExpandCollapseTitle(
                  isExpanded: _isExpanded,
                  expandedLabel: Text(
                    _distributorName.trim(),
                    style: AppTextStyles.style16W700Black(),
                  ),
                  collapsedLabel: Text(_distributorName.trim(),
                      style: AppTextStyles.style16W700Black()),
                  onExpandOrCollapse: null),
              const Expanded(
                  child: SizedBox(
                width: double.infinity,
              )),
              PrimaryCheckBox(
                checkBoxText: null,
                isChecked: _isSelected,
                onChanged: (bool isSelected) {
                  cartScreenCubit.onStoreSelected(storeId, isSelected);
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '${context.localizedString.items}: ',
                            style: AppTextStyles.style11W400Red(
                              color: AppColors.lightGrey,
                            )),
                        TextSpan(
                            text: _items.toString(),
                            style: AppTextStyles.style11W500MedGrey(
                              color: AppColors.primaryTextColor,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '${context.localizedString.total}: ',
                            style: AppTextStyles.style11W400Red(
                              color: AppColors.lightGrey,
                            )),
                        TextSpan(
                            text: '₹ ${_total.toStringAsFixed(2)}',
                            style: AppTextStyles.style12W700Black(
                              color: AppColors.primaryTextColor,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchProductPage()));
                },
                child: Text(
                  '+ ${context.localizedString.addProduct}',
                  style: AppTextStyles.listItemValueStyle12W500
                      .copyWith(color: AppColors.secondaryButtonTextColor),
                ),
              )
            ],
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }

  void openAddProductDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddSingleProductInCartPopup(
          distributorName: _distributorName,
          storeId: storeId,
          callBack: () {
            cartScreenCubit.getCartDetails();
          },
        );
      },
    );
  }
}

class _CartProductListItem extends StatelessWidget {
  final CartListItemEntity cartProduct;

  const _CartProductListItem(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.instance.get<CartScreenCubit>();
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(top: 10),
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: cartProduct.isValid == false &&
                          cartProduct.errorMessage != null
                      ? AppColors.redErrorColor
                      : AppColors.dividerColor)),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10.0),
                  Text(
                    cartProduct.productName ?? "",
                    style: AppTextStyles.style12W700Black(fontSize: 14),
                    maxLines: 1,
                  ),
                  const SizedBox(width: 10.0),
                  OfferLabel(offerLabel: cartProduct.scheme ?? ""),
                  const Expanded(child: SizedBox.shrink()),
                  CartItemOptionsPopup(
                    onClickChangeDistributor: () async {
                      await showDialog(
                        context: context,
                        builder: (_) {
                          return ChangeDistributorDialogCard(
                            productCode: cartProduct.productId.toString(),
                            storeId: cartProduct.storeId!,
                          );
                        },
                      );
                      LogUtil.info('Change distributor dialog closed');
                      cubit.refreshScreenData();
                    },
                    onClickDeleteItem: () {
                      cubit.deleteCartProduct(
                        storeId: cartProduct.storeId!.toString(),
                        productId: cartProduct.productCode!,
                      );
                    },
                  ),
                  const SizedBox(width: 5.0),
                ],
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PurchaseDetailsRow(
                  ptr: cartProduct.ptr,
                  mrp: double.parse(cartProduct.mrp ?? ''),
                  stockQuantity: cartProduct.stock,
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: AppColors.dividerColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10.0),
                  Text("${context.localizedString.quantityShortForm}:"),
                  const SizedBox(width: 5),
                  QuantityInputField(
                    cartItem: cartProduct,
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          " ₹ ${cartProduct.productWiseAmount?.toStringAsFixed(2)}",
                          style: AppTextStyles.style16W700Black(),
                        )),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
              const SizedBox(height: 10.0),
              cartProduct.isValid == false && cartProduct.errorMessage != null
                  ? Container(
                      height: 1,
                      color: AppColors.redErrorColor,
                    )
                  : Container(),
              cartProduct.isValid == false && cartProduct.errorMessage != null
                  ? Container(
                      //height: 18,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(
                          color: AppColors.productErrorBg,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Text(
                        cartProduct.errorMessage ?? '',
                        style: AppTextStyles.style11W400Red(),
                        maxLines: 2,
                      ),
                    )
                  : Container()
            ]));
  }
}
