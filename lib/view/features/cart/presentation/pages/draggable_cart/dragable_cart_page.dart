import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/app_drop_down/app_drop_down.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_utils.dart';
import 'package:pharmarack/view/features/cart/di/cart_provider.dart';
import 'package:pharmarack/view/features/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:pharmarack/view/features/cart/presentation/pages/draggable_cart/widgets/cart_distributor_list_item.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';

class DraggableCartPage extends StatefulWidget {
  const DraggableCartPage({super.key});

  @override
  DraggableCartPageState createState() => DraggableCartPageState();
}

class DraggableCartPageState extends State<DraggableCartPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _buildCollapseView(context: context);
  }

  _buildCollapseView(
      {required BuildContext context, bool fromExpandedView = false}) {
    return BlocConsumer(
      bloc: draggableCartScreenCubit,
      listener: (BuildContext context, state) {},
      buildWhen: (previous, current) {
        return (current is CartScreenInitialState) ||
            (current is CartScreenNoDataState) ||
            (current is CartScreenDataState);
      },
      builder: (BuildContext context, state) {
        if (state is CartScreenInitialState) {
          return Container();
        } else if (state is CartScreenNoDataState) {
          return Container();
        } else if (state is CartScreenDataState) {
          final cartDetails = state.cartDetails;

          if (fromExpandedView) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
              child: _buildCartValues(cartDetails),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildLastItemAdded(),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        _expandCart();
                      },
                      child: Container(
                        color: AppColors.draggableCartColor,
                        padding: const EdgeInsets.only(top: 8),
                        child: Center(child: AppAssets.svg.upBroadArrow.svg()),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: _buildCartValues(cartDetails),
                  )
                ],
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }

  _buildLastItemAdded() {
    final lastAddedProduct = draggableCartScreenCubit.getLastAddedProduct();

    // final quantity =
    //     lastAddedProduct?.scheme != null && lastAddedProduct?.scheme != ''
    //         ? lastAddedProduct?.quantityWithScheme
    //         : lastAddedProduct?.quantity;

    return Container(
      height: 33,
      color: AppColors.offerBottomStripColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 9,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "${context.localizedString.lastAdded}: ",
                      style: AppTextStyles.style12W700Black(
                          fontSize: 13, color: AppColors.blackTextFieldText)),
                  TextSpan(
                      text: "${lastAddedProduct?.productName}",
                      style: AppTextStyles.searchFilterTitleStyleW300.copyWith(
                          color: AppColors.blackTextFieldText, fontSize: 13)),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              "${context.localizedString.qty}: "
              "${lastAddedProduct?.quantity}",
              style: AppTextStyles.style11W400Red(
                  color: AppColors.blackTextFieldText),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  _buildCartValues(
    CartDetailsModel cartDetails,
  ) {
    final formatAmount = AppUtils.thousandFormator(cartDetails.totalCartValue);
    return Container(
      color: AppColors.draggableCartColor,
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: _getTitleAndValueWidget(
                      title: context.localizedString.items,
                      textValue: '${cartDetails.totalItems}'),
                ),
                Flexible(
                  flex: 1,
                  child: _getTitleAndValueWidget(
                      title: context.localizedString.distributors,
                      textValue: '${cartDetails.stores.length}'),
                ),
                Flexible(
                  flex: 1,
                  child: _getTitleAndValueWidget(
                      title: context.localizedString.cartValue,
                      textValue: "₹ $formatAmount"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: PrimaryButton(
              text: context.localizedString.viewCart.toUpperCase(),
              width: MediaQuery.of(context).size.width * 0.31,
              onPressed: () {
                getIt<BottomNavigationCubit>().updateBottomNavigationIndex(4);
              },
            ),
          )
        ],
      ),
    );
  }

  _buildExpandedView() {
    return BlocConsumer(
        listener: (context, state) {
          if (state is CartScreenLoadingState) {
            showProcessingRequestDialog(
              context,
              userRootNavigator: false,
            );
          } else if (state is CartScreenNoDataState) {
            CommonDialogs.closeCommonDialog(context: context);
            Navigator.pop(context);
          } else {
            CommonDialogs.closeCommonDialog(context: context);
          }
        },
        bloc: draggableCartScreenCubit,
        buildWhen: (previous, current) {
          return (current is CartScreenLoadingState) ||
              (current is CartScreenNoDataState) ||
              (current is CartScreenDataState) ||
              (current is CartDistributorSelectedState);
        },
        builder: (context, state) {
          CartDetailsModel? cartDetails;

          if (state is CartScreenDataState) {
            cartDetails = state.cartDetails;
          }
          if (state is CartDistributorSelectedState) {
            cartDetails = state.cartDetails;
          }

          return cartDetails != null && cartDetails.stores.isNotEmpty
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.dialogBackground,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            color: AppColors.dialogBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _collapseCart();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Center(
                                        child:
                                            AppAssets.svg.downBroadArrow.svg()),
                                  ),
                                ),
                                _buildCartAndDropDown(context),
                                ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 0),
                                  itemCount: cartDetails.stores.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CartDistributorListItem(
                                      stores: cartDetails!.stores[index],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.11,
                          child: _buildCollapseView(
                              context: context, fromExpandedView: true),
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink();
        });
  }

  _buildCartAndDropDown(BuildContext context) {
    final distributorsList = draggableCartScreenCubit.getDistributorList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localizedString.cart,
          style:
              AppTextStyles.searchFilterTitleStyleW300.copyWith(fontSize: 18),
        ),
        AppDropDown(
          options: distributorsList,
          dropDownWidth: 140,
          onSelected: (distributor) {
            draggableCartScreenCubit.getProductListForDistributor(distributor);
          },
        ),
      ],
    );
  }

  _getTitleAndValueWidget({required String title, required String textValue}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: '$title: ',
              style: AppTextStyles.style12W700Black(
                  color: AppColors.cardTitleColor, fontSize: 14)),
          TextSpan(
            text: textValue,
            style: AppTextStyles.style12W700Black(
              color: AppColors.cardTitleColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _expandCart() {
    draggableCartScreenCubit
        .getAllDistributorAndProductList(); // reset the last selection/state
    showModalBottomSheet(
      useRootNavigator: false,
      isScrollControlled: true,
      context: context,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
      builder: (context) {
        return _buildExpandedView();
      },
    );
  }

  void _collapseCart() {
    Navigator.pop(context);
  }
}
