import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/product_list_item/product_list_item.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/custom_blur_view.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_state.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/widgets/add_product_to_cart_popup.dart';

/// This class [SearchProductPageMobileView] which specifically used to render Mobile UI
class SearchProductPageMobileView extends StatelessWidget {
  final List<SearchProductListModel> productList;
  final SearchProductCubit searchProductCubit;

  const SearchProductPageMobileView(
      {super.key, required this.productList, required this.searchProductCubit});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: BlocBuilder(
          bloc: searchProductCubit,
          buildWhen: (previous, current) {
            return current is SearchProductBlurState;
          },
          builder: (context, state) {
            final isBlur =
                state is SearchProductBlurState ? state.isBlur : false;
            return CustomBlurView(
              child: _buildBody(context),
              isBlur: isBlur,
              onTap: () {
                AppConstants.dropDownHandler.add(true);
              },
            );
          },
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: ProductListItem(
                    index: index,
                    productName: product.productName,
                    //MOVP  productName
                    mrp: product.mrp,
                    qty: product.qty,
                    storeName: product.storeName,
                    ptr: product.ptr,
                    company: product.company,
                    //MOVP  company
                    stock: product.stock,
                    margin: product.margin,
                    expiryDate: product.expiryDate,
                    storeProductGST: product.storeProductGST,
                    scheme: product.scheme!.isNotEmpty ? product.scheme : 'NA',
                    cashbackMessage: product.cashbackMessage,
                    rStockVisibility: product.rStockVisibility,
                    packing: product.packing,
                    plusButtonTapped: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddProductToCartPopup(
                            productDetails: product,
                          );
                        },
                      );
                    },
                  ),
                ),
                alreadyAddedWidget(product, context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget alreadyAddedWidget(
      SearchProductListModel product, BuildContext context) {
    return product.isAlreadyAdded != null && product.isAlreadyAdded == true
        ? Positioned(
            top: 2,
            right: 8,
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.statusTextColor),
                padding:
                    const EdgeInsets.only(right: 8, left: 5, bottom: 2, top: 2),
                // width: 70,
                child: Row(
                  children: [
                    AppAssets.svg.tickSelected.svg(color: AppColors.white),
                    Text(
                      context.localizedString.added,
                      style: AppTextStyles.style12W700Black(
                          fontSize: 11, color: AppColors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )),
          )
        : const SizedBox.shrink();
  }
}
