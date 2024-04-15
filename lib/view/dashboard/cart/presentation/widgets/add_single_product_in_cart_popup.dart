import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/processing_request_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/request_failed_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/error_message_widget.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/title_and_value_row_item.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_rounder_corner_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/utils/retailer_utils.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/add_product_to_cart_cubit.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';

import '../../../../../packages/core_flutter/common_widgets/common_dialogs/success_custom_dialog.dart';
import '../../../../features/change_distributor/presentation/widget/purchase_details_row.dart';
import '../../../../features/search_product/di/search_product_providers.dart';
import '../../../../features/search_product/domain/model/search_product/search_product_model.dart';
import '../../../../features/search_product/presentation/cubit/add_product_to_cart_state.dart';
import '../../../../features/search_product/presentation/cubit/search_product_state.dart';
import '../../di/cart_provider.dart';

class AddSingleProductInCartPopup extends StatefulWidget {
  final String distributorName;
  final int storeId;
  final Function callBack;

  const AddSingleProductInCartPopup({
    super.key,
    required this.distributorName,
    required this.storeId,
    required this.callBack,
  });

  @override
  State<AddSingleProductInCartPopup> createState() =>
      _AddSingleProductInCartPopupState();
}

class _AddSingleProductInCartPopupState
    extends State<AddSingleProductInCartPopup> {
  late SearchProductCubit searchProductCubit;
  late AddProductToCartCubit addProductToCartCubit;

  @override
  void initState() {
    super.initState();
    deInitStockiestDI();
    initStockiestDI();
    intProductDI();
    intCartDI();
    searchProductCubit = getIt<SearchProductCubit>();
    addProductToCartCubit = getIt<AddProductToCartCubit>();
    addProductToCartCubit.quantityController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      surfaceTintColor: AppColors.dialogBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder(
        bloc: addProductToCartCubit,
        builder: (context, state) {
          if (state is AddProductToCartLoadingState) {
            return const ProcessingRequestWidget();
          } else if (state is AddProductToCartDataState) {
            Future.delayed(const Duration(seconds: 2)).then((value) {
              widget.callBack();
              Navigator.pop(context);
            });
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
              child: SuccessDialog(
                title: context.localizedString.success,
                hideCloseIcon: true,
                onCloseClick: () {
                  Navigator.pop(context);
                  widget.callBack();
                },
              ),
            );
          } else if (state is AddProductToCartErrorState) {
            return const RequestFailedWidget();
          } else {
            return _buildSuccessWidget(context);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    deIntCartDI();
    deInitStockiestDI();
    deInitProductDI();
  }

  Widget _buildSuccessWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height * 0.30,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.distributorName.trim(),
                  style: AppTextStyles.style16W400Black(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: const EdgeInsets.only(top: 1),
                  child: AppAssets.svg.icClose
                      .svg(height: 20, width: 20, package: 'core_flutter'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ProductListDropdownMenu(
            titleText: 'List of products',
            hintText: context.localizedString.selectDistributor,
            distributorName: widget.distributorName,
            storeId: widget.storeId,
            callBack: () {
              setState(() {});
            },
          ),
          const SizedBox(height: 13),
          searchProductCubit.productListModel != null
              ? PurchaseDetailsRow(
                  ptr: searchProductCubit.productListModel!.ptr,
                  mrp: searchProductCubit.productListModel!.mrp,
                  stockQuantity: searchProductCubit.productListModel!.stock,
                  scheme: searchProductCubit.productListModel!.scheme,
                )
              : Container(),
          const SizedBox(height: 10),
          addQuantityView(context),
          searchProductCubit.productListModel != null
              ? const SizedBox(height: 10)
              : Container(),
        ],
      ),
    );
  }

  Widget addQuantityView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                width: MediaQuery.of(context).size.width * 0.58,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.localizedString.quantity,
                      style: AppTextStyles.style11W500MedGrey(),
                    ),
                    searchProductCubit.productListModel?.scheme != null &&
                            searchProductCubit.productListModel?.scheme != "" &&
                            searchProductCubit.productListModel?.qty != null
                        ? BlocBuilder(
                            bloc: addProductToCartCubit,
                            buildWhen: (previous, current) {
                              return (current is FreeValueUpdateState);
                            },
                            builder: (context, state) {
                              if (state is FreeValueUpdateState) {
                                return TitleAndAmountRowItem(
                                  value: RetailerUtils
                                      .getFreeTabletsCountAsPerScheme(
                                    searchProductCubit.productListModel?.scheme,
                                    state.quantity,
                                  ).toString(),
                                  title: context.localizedString.free,
                                  textColor: AppColors.primaryOrangeColor,
                                );
                              }

                              return const SizedBox.shrink();
                            },
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              BlocBuilder(
                bloc: addProductToCartCubit,
                buildWhen: (previous, current) {
                  return current is QuantityValidatorState ||
                      current is ResetQuantityValidatorState;
                },
                builder: (context, state) {
                  String errorMessage = "";
                  Color borderColor = Colors.transparent;

                  if (state is QuantityValidatorState) {
                    borderColor = Colors.red;
                    errorMessage = state.errorMessage;
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            SizedBox(
                                height: 40,
                                child: Form(
                                  key: cartScreenCubit.formQuantityKey,
                                  child: TextFormField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9a-zA-Z]")),
                                    ],
                                    //
                                    controller: addProductToCartCubit
                                        .quantityController,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      fillColor: AppColors.lightGreyTextField,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: borderColor),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        value = '0';
                                      }
                                      addProductToCartCubit
                                          .resetQuantityField();
                                      addProductToCartCubit
                                          .updateFreeValue(int.parse(value));
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                )),
                            errorMessage != ""
                                ? ErrorMessageWidget(
                                    errorMessage: errorMessage,
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        //   margin: const EdgeInsets.only(top: 20),
                        child: PrimaryRoundedCornerButton(
                            text: context.localizedString.addCaps,
                            color: errorMessage != ""
                                ? AppColors.secondaryGreyedOutColor
                                : AppColors.secondaryColor,
                            cornerRadius: 5.0,
                            onTap: () {
                              addProductToCartCubit.validateQuantityField(
                                  productDetails:
                                      searchProductCubit.productListModel!,
                                  quantity: addProductToCartCubit
                                      .quantityController.text,
                                  context: context);
                            }),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class ProductListDropdownMenu extends StatefulWidget {
  final String titleText;
  final String hintText;
  final String distributorName;
  final int storeId;
  final Function callBack;

  const ProductListDropdownMenu({
    super.key,
    required this.titleText,
    required this.hintText,
    required this.distributorName,
    required this.storeId,
    required this.callBack,
  });

  @override
  State<ProductListDropdownMenu> createState() =>
      _ProductListDropdownMenuState();
}

class _ProductListDropdownMenuState extends State<ProductListDropdownMenu> {
  double _overlayWidth = 0;
  double _overlayMaxHeight = 0;
  final _layerLink = LayerLink();
  final _overlayPortalController = OverlayPortalController();
  late SearchProductCubit searchProductCubit;

  @override
  void initState() {
    super.initState();
    searchProductCubit = getIt<SearchProductCubit>();
    cartScreenCubit.searchController.text = '';
    Future(() => _toggleMenuVisibility());
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: OverlayPortal(
        controller: _overlayPortalController,
        overlayChildBuilder: (context) {
          return CompositedTransformFollower(
            link: _layerLink,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: Alignment.topLeft,
              // child: _buildOverlayListWidget(context, _overlayWidth),
              child: BlocBuilder(
                bloc: searchProductCubit,
                builder: (BuildContext context, state) {
                  if (state is SearchProductFilteredDataState) {
                    return _buildOverlayListWidget(
                        context, _overlayWidth, state.mappedList!);
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        },
        child: _buildMenuWidget(context),
      ),
    );
  }

  Widget _buildMenuWidget(BuildContext context) {
    // final String menuText;
    // final Color menuTextColor;
    // if (_selectedDistributorName != null) {
    //   menuText = _selectedDistributorName!;
    //   menuTextColor = context.colors.textPrimary!;
    // } else {
    //   menuText = widget.hintText;
    //   menuTextColor = context.colors.textSecondary!;
    // }

    return TextInputField(
      titleRowPadding: const EdgeInsets.only(bottom: 5),
      controller: cartScreenCubit.searchController,
      title: widget.titleText,
      keyboardType: TextInputType.text,
      informationType: InformationType.error,
      suffixIcon: GestureDetector(
        onTap: () {
          _toggleMenuVisibility();
        },
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(8),
          child: AppAssets.svg.arrowDown.svg(
            colorFilter: ColorFilter.mode(
              context.colors.primary!,
              BlendMode.srcIn,
            ),
            package: 'core_flutter',
          ),
        ),
      ),
      onChanged: (value) {
        searchProductCubit.handleSearchText(
            query: value,
            storeName: widget.distributorName,
            id: widget.storeId);
      },
    );
  }

  void _toggleMenuVisibility() {
    _setOverlayDimensions();
    _overlayPortalController.toggle();
    setState(() {});
  }

  void _setOverlayDimensions() {
    final menuHeight = context.size?.height ?? 0;
    final maxScreenHeight = MediaQuery.of(context).size.height;
    final renderBox = (context.findRenderObject() as RenderBox);
    final yPosition = renderBox.localToGlobal(Offset.zero).dy;
    final availableHeight = maxScreenHeight - yPosition - menuHeight;
    const bottomPadding = 4;

    setState(() {
      _overlayMaxHeight = availableHeight - bottomPadding;
      _overlayWidth = context.size?.width ?? 0;
    });
  }

  Widget _buildOverlayListWidget(BuildContext context, double overlayWidth,
      List<SearchProductListModel> mappedList) {
    final itemCount = mappedList.length;
    const listItemHeight = 44.0;
    const dividerHeight = 22.0;
    const verticalPadding = 10.0;

    final double overlayHeight;
    if (itemCount > 0) {
      overlayHeight = (listItemHeight * itemCount) +
          (dividerHeight * (itemCount - 1)) +
          verticalPadding +
          verticalPadding;
    } else {
      overlayHeight = 0;
    }
    return Container(
      width: _overlayWidth,
      height: min(overlayHeight, _overlayMaxHeight),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: context.colors.separatorPrimary!,
        ),
        color: context.colors.screenBackground,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.only(
          top: verticalPadding,
          left: 10,
          right: 10,
          bottom: verticalPadding,
        ),
        itemCount: itemCount,
        separatorBuilder: (context, index) {
          return Divider(
            height: dividerHeight,
            thickness: 1,
            color: context.colors.separatorSecondary,
          );
        },
        itemBuilder: (context, index) {
          final productList = mappedList[index];
          return InkWell(
            onTap: () {
              _onClickListItem(mappedList[index]);
              widget.callBack();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(productList.productFullName!,
                        style: AppTextStyles.style12W700Black(
                          color: AppColors.cardTitleColor,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        productList.company != null && productList.company != ''
                            ? Container(
                                constraints: BoxConstraints(
                                    minWidth: 30,
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.3),
                                padding: const EdgeInsets.only(
                                  top: 0,
                                ),
                                child: Text(
                                  productList.company ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyles.style12W700Black(
                                      color: AppColors.dashboardSubTitleColor),
                                ),
                              )
                            : const SizedBox.shrink(),
                        productList.company != null && productList.company != ''
                            ? Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: AppAssets.svg.blueArrowUpRight.svg(
                                    package: 'core_flutter',
                                    height: 12,
                                    width: 12),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                FittedBox(
                  child: PurchaseDetailsRow(
                      ptr: productList.ptr,
                      mrp: productList.mrp,
                      stockQuantity: productList.stock,
                      scheme: productList.scheme),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onClickListItem(SearchProductListModel productListModel) {
    cartScreenCubit.searchController.text = productListModel.productFullName!;
    searchProductCubit.updateDialogProductData(productListModel);
    _toggleMenuVisibility();
  }
}
