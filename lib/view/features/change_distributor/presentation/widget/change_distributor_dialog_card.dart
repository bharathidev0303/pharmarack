import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/dialog_card.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/processing_request_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/request_failed_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/success_custom_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_fonts.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/utils/retailer_utils.dart';
import 'package:pharmarack/view/features/change_distributor/presentation/bloc/change_distributor_dialog_cubit.dart';
import 'package:pharmarack/view/features/change_distributor/presentation/bloc/change_distributor_dialog_state.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/search_product_page.dart';

import '../bloc/distributor_details.dart';
import 'offer_text.dart';
import 'purchase_details_row.dart';

class ChangeDistributorDialogCard extends StatefulWidget {
  final int? productCode;
  final int storeId;

  ChangeDistributorDialogCard({
    super.key,
    required String productCode,
    required this.storeId,
  }) : productCode = int.tryParse(productCode);

  @override
  State<ChangeDistributorDialogCard> createState() =>
      _ChangeDistributorDialogCardState();
}

class _ChangeDistributorDialogCardState
    extends State<ChangeDistributorDialogCard> {
  final _quantityTextFieldController = TextEditingController();

  String? _quantityInputError;
  int? _quantity;
  String _freeQuantity = '0';
  int pageNo = 1;

  void _onChangeQuantity(int quantity, ChangeDistributorDataState state) {
    setState(() {
      _quantity = quantity;
      if (quantity <= 0) {
        _quantityInputError = context.localizedString.zeroQuantity;
      } else {
        _quantityInputError = null;
      }
      _freeQuantity = RetailerUtils.getFreeTabletsCountAsPerScheme(
        state.selectedDistributor?.scheme,
        quantity,
      ).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productCode == null) {
      return RequestFailedDialog(
        title: 'Invalid integer product code: ${widget.productCode}',
      );
    }
    return BlocProvider<ChangeDistributorDialogCubit>(
      create: (context) => GetIt.instance.get<ChangeDistributorDialogCubit>()
        ..fetchProductDistributors(widget.productCode!, pageNo),
      child: BlocBuilder<ChangeDistributorDialogCubit,
          ChangeDistributorDialogState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (ChangeDistributorSuccessState):
              return const SuccessDialog(
                title: 'Distributor Changes Successfully',
              );
            case const (ChangeDistributorLoadingState):
              return const ProcessingRequestDialog();
            case const (ChangeDistributorDataState):
              return _buildSuccessWidget(
                context,
                state as ChangeDistributorDataState,
              );
            case const (ChangeDistributorErrorState):
              return const RequestFailedDialog();
            case const (NoDistributorsFoundErrorState):
              return _buildNoDistributor(
                context,
                state as NoDistributorsFoundErrorState,
              );
            default:
              throw Exception(
                'Unknown state while building the ChangeDistributorDialogCard: $state',
              );
          }
        },
      ),
    );
  }

  Widget _buildSuccessWidget(
    BuildContext context,
    ChangeDistributorDataState state,
  ) {
    final cubit = context.read<ChangeDistributorDialogCubit>();
    return DialogCard(
      title: state.productName,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          OfferText(name: state.offerName ?? '', value: state.offerValue ?? ''),
          const SizedBox(height: 8),
          DistributorsDropdownMenu(
            titleText: context.localizedString.distributor,
            hintText: context.localizedString.selectDistributor,
            distributors: state.distributors,
            onDistributorSelected: (distributorId) {
              cubit.selectDistributor(distributorId);
            },
          ),
          const SizedBox(height: 13),
          PurchaseDetailsRow(
            ptr: state.selectedDistributor?.ptr ?? 0.0,
            mrp: state.selectedDistributor?.mrp ?? 0.0,
            stockQuantity: state.selectedDistributor?.stockQuantity ?? 0,
            scheme: state.selectedDistributor?.scheme ?? '',
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: TextInputField(
                  titleRowPadding: const EdgeInsets.only(bottom: 5),
                  title: context.localizedString.quantity,
                  offerName: context.localizedString.free,
                  offerValue: _freeQuantity,
                  controller: _quantityTextFieldController,
                  keyboardType: TextInputType.number,
                  informationText: _quantityInputError,
                  informationType: InformationType.error,
                  onChanged: (value) => _onChangeQuantity(
                    int.tryParse(value) ?? 0,
                    state,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 72,
                  child: PrimaryButton(
                    text: context.localizedString.add,
                    onPressed: () {
                      if (_quantityInputError == null &&
                          _quantity != null &&
                          _quantity! > 0) {
                        cubit.changeDistributor(
                          productCode: widget.productCode!,
                          storeId: widget.storeId,
                          quantity: _quantity!,
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNoDistributor(
    BuildContext context,
    NoDistributorsFoundErrorState state,
  ) {
    // final cubit = context.read<ChangeDistributorDialogCubit>();
    return DialogCard(
      title: state.productName,
      type: 'no_distributor',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Transform.scale(
              scaleX: -1,
              child: const Icon(
                Icons.search_off_outlined,
                size: 44,
                color: Color.fromRGBO(144, 144, 144, 1),
              )),
          const SizedBox(height: 10),
          Text(
            "No distributors found for \n above product",
            style: TextStyle(
                color: const Color.fromRGBO(144, 144, 144, 1),
                fontFamily: AppFonts.helveticaNeue,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 13),
          PrimaryButton(
              text: 'SELECT DIFFERENT PRODUCT',
              onPressed: () {
                // Navigator.pushNamed(context, RoutePaths.searchProduct);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchProductPage()));
              }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class DistributorsDropdownMenu extends StatefulWidget {
  final String titleText;
  final String hintText;
  final List<DistributorDetails> distributors;
  final Function(int id) onDistributorSelected;

  const DistributorsDropdownMenu({
    super.key,
    required this.titleText,
    required this.hintText,
    required this.distributors,
    required this.onDistributorSelected,
  });

  @override
  State<DistributorsDropdownMenu> createState() =>
      _DistributorsDropdownMenuState();
}

class _DistributorsDropdownMenuState extends State<DistributorsDropdownMenu> {
  bool _isDropdownVisible = false;
  double _overlayWidth = 0;
  double _overlayMaxHeight = 0;
  String? _selectedDistributorName;
  final _layerLink = LayerLink();
  final _overlayPortalController = OverlayPortalController();

  @override
  void initState() {
    super.initState();
    // Display the overlay after the widget is rendered
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
              child: _buildOverlayListWidget(context, _overlayWidth),
            ),
          );
        },
        child: _buildMenuWidget(context),
      ),
    );
  }

  Widget _buildMenuWidget(BuildContext context) {
    final String menuText;
    final Color menuTextColor;
    if (_selectedDistributorName != null) {
      menuText = _selectedDistributorName!;
      menuTextColor = context.colors.textPrimary!;
    } else {
      menuText = widget.hintText;
      menuTextColor = context.colors.textSecondary!;
    }

    return GestureDetector(
      onTap: () {
        // Toggle only when distributor is selected
        // Forces the user to select a distributor when dialog is opened for the first time
        if (_selectedDistributorName != null) {
          _toggleMenuVisibility();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              widget.titleText,
              style: context.textStyles.paragraph3Medium?.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: const Radius.circular(5),
                bottom: Radius.circular(_isDropdownVisible ? 0 : 5),
              ),
              color: context.colors.inputField,
            ),
            child: Row(
              children: [
                Text(
                  menuText,
                  style: context.textStyles.paragraph1Regular?.copyWith(
                    color: menuTextColor,
                  ),
                ),
                const Spacer(flex: 1),
                AppAssets.svg.arrowDown.svg(
                  colorFilter: ColorFilter.mode(
                    context.colors.primary!,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _toggleMenuVisibility() {
    _setOverlayDimensions();
    _overlayPortalController.toggle();
    setState(() {
      _isDropdownVisible = _overlayPortalController.isShowing;
    });
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

  Widget _buildOverlayListWidget(BuildContext context, double overlayWidth) {
    final itemCount = widget.distributors.length;
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
          final distributor = widget.distributors[index];
          return InkWell(
            onTap: () {
              _onClickListItem(distributor);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  distributor.name,
                  style: context.textStyles.paragraph1Regular?.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 5),
                PurchaseDetailsRow(
                  ptr: distributor.ptr ?? 0.0,
                  mrp: distributor.mrp ?? 0.0,
                  stockQuantity: distributor.stockQuantity ?? 0,
                  scheme: distributor.scheme ?? '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onClickListItem(DistributorDetails distributor) {
    widget.onDistributorSelected(distributor.id);
    setState(() {
      _selectedDistributorName = distributor.name;
    });
    _toggleMenuVisibility();
  }
}
