import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/primary_check_box.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/cart/di/cart_provider.dart';
import 'package:pharmarack/view/dashboard/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/widgets/view_cart_bottom_widget.dart';

import '../pages/cart_product_list.dart';

class CartWidget extends StatefulWidget {
  final CartDetailsModel _cartDetailsModel;

  const CartWidget(this._cartDetailsModel, {super.key});

  @override
  State<StatefulWidget> createState() => CartWidgetState();
}

class CartWidgetState extends State<CartWidget> {
  _onExpandOrCollapse(bool isExpanded) {
    cartScreenCubit.onAllStoreItemsExpandCollapse(isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Row(
          children: [
            ExpandCollapseTitle(
                isExpanded: widget._cartDetailsModel.isAllExpanded,
                expandedLabel: Text(
                  context.localizedString.expandAll,
                  style: AppTextStyles.textFieldNameStyle12W500,
                ),
                collapsedLabel: Text(
                  context.localizedString.collapseAll,
                  style: AppTextStyles.textFieldNameStyle12W500,
                ),
                onExpandOrCollapse: (isExpanded) =>
                    {_onExpandOrCollapse(isExpanded)}),
            const Expanded(
                child: SizedBox(
              width: double.infinity,
            )),
            PrimaryCheckBox(
              checkBoxText: Text(
                context.localizedString.select,
                style: AppTextStyles.textFieldNameStyle12W500,
              ),
              isChecked: widget._cartDetailsModel.isAllSelected,
              onChanged: (bool isSelected) {
                cartScreenCubit.onAllStoreSelected(isSelected);
              },
            ),
          ],
        ),
      ),
      Expanded(child: CartProductList(stores: widget._cartDetailsModel.stores)),
      ViewCartBottomWidget(
        itemsCount: widget._cartDetailsModel.totalItems,
        distributorCount: widget._cartDetailsModel.totalSelectedStores,
        cartValue: widget._cartDetailsModel.totalCartValue,
        offerText: null,
        onButtonClick: () {
          if (cartScreenCubit.checkOrderIsValid()) {
            cartScreenCubit.placeOrder();
          }
        },
      )
    ]);
  }
}

class ExpandCollapseTitle extends StatefulWidget {
  final Text? expandedLabel;
  final Text? collapsedLabel;
  final Function(bool isExpanded)? onExpandOrCollapse;
  final bool isExpanded;

  const ExpandCollapseTitle(
      {this.isExpanded = false,
      this.expandedLabel,
      this.collapsedLabel,
      this.onExpandOrCollapse,
      super.key});

  @override
  State<ExpandCollapseTitle> createState() => _ExpandCollapseTitleState();
}

class _ExpandCollapseTitleState extends State<ExpandCollapseTitle> {
  bool _isExpanded = false;

  _expandCollapse(bool isExpanded) {
    setState(() {
      _isExpanded = isExpanded;
    });
    widget.onExpandOrCollapse?.call(isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    _isExpanded = widget.isExpanded;
    return InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTap: widget.onExpandOrCollapse != null
          ? () {
              _expandCollapse(_isExpanded ? false : true);
            }
          : null,
      child: Row(
        children: [
          _isExpanded
              ? widget.collapsedLabel ?? const SizedBox.shrink()
              : widget.expandedLabel ?? const SizedBox.shrink(),
          const SizedBox(width: 5),
          SvgPicture.asset(
            _isExpanded
                ? AppAssets.svg.icArrowUp.path
                : AppAssets.svg.icArrowDown.path,
            width: 18,
            height: 18,
          )
        ],
      ),
    );
  }
}

class QuantityInputField extends StatefulWidget {
  final CartListItemModel cartItem;

  const QuantityInputField({required this.cartItem, super.key});

  @override
  State<StatefulWidget> createState() => QuantityButtonTextFieldToggleState();
}

class QuantityButtonTextFieldToggleState extends State<QuantityInputField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    _textFieldController.text =
        "${widget.cartItem.quantity}${widget.cartItem.free != 0 ? ' + ${widget.cartItem.free}' : ''}";
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _textFieldController.clear();
      } else {
        if (_textFieldController.text == "") {
          _textFieldController.text =
              "${widget.cartItem.quantity}${widget.cartItem.free != 0 ? ' + ${widget.cartItem.free}' : ''}";
          cartScreenCubit.updateCartItemAmount(
              widget.cartItem, _textFieldController.text);
        } else {
          cartScreenCubit.validateQuantityField(
              cartItem: widget.cartItem, quantity: _textFieldController.text);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 40),
        child: TextField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
          ],
          style: AppTextStyles.blueLinkTextStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                      color: AppColors.secondaryButtonColor)),
              filled: true,
              fillColor: AppColors.secondaryButtonColor),
          controller: _textFieldController,
          onChanged: (value) {
            if (value.isEmpty) {
              value = '0';
            }
            cartScreenCubit.updateCartItemAmount(widget.cartItem, value);
          },
          onTap: () {},
          focusNode: _focusNode,
        ),
      ),
    );
  }
}
