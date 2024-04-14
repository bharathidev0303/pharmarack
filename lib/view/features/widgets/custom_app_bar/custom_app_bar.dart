import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/app_theme_colors.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/search_product/di/search_product_providers.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_context_model.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar_cubit.dart';
import '../dropdown/custom_drop_down.dart';
import '../dropdown/distributor_drop_down/cubit/distributor_drop_down_cubit.dart';
import '../dropdown/distributor_drop_down/distributor_drop_down_view.dart';
import 'custom_app_bar_state.dart';
import 'di.dart';

/// Dashboard app bar is common appbar for all screen where we need to implement
/// page with search functionality.

//ignore: must_be_immutable
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String)? onTextTypedForProduct;
  final Function(String, int?, String, String, String, String)?
      productAndDistributorCallBack;
  final Function(bool)? onDropDownOpenCallBackForDistributor;
  final Function? callbackForHamburger;
  final void Function()? onPressNotifications;
  final bool isInterActive;
  final AppBarType type;
  final String? page;
  final SearchContextModel? searchContextModel;
  final VoidCallback? onFilterClick;
  final int? searchBarFocusValue;

  const CustomAppBar(
      {super.key,
      this.onTextTypedForProduct,
      this.callbackForHamburger,
      this.onDropDownOpenCallBackForDistributor,
      this.productAndDistributorCallBack,
      this.onPressNotifications,
      this.isInterActive = true,
      this.type = AppBarType.secondaryAppBar,
      this.page,
      this.searchContextModel,
      this.onFilterClick,
      this.searchBarFocusValue});

  static const int maxLength = 15;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(61);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final GlobalKey _widgetKey = GlobalKey();

  OverlayEntry? _overlayEntry;

  bool isDropdownOpen = false;

  TextEditingController productTextController = TextEditingController();

  TextEditingController distributorTextController = TextEditingController();

  final FocusNode _distributorFocusNode = FocusNode();
  final FocusNode _productSearchFocusNode = FocusNode();

  late CustomAppBarCubit appBarCubit;
  late DistributorDropDownCubit distributorDropDownCubit;

  String selectedStoreName = '';
  int selectedDistributorId = 0;
  String selectedCompanyId = '';
  String selectedCompanyName = '';
  String contextType = '';

  @override
  void initState() {
    deInitStockiestDI();
    initStockiestDI();
    deInitDI();
    initDI();
    appBarCubit = getIt<CustomAppBarCubit>();
    distributorDropDownCubit = getIt<DistributorDropDownCubit>();
    if (widget.searchBarFocusValue != null && widget.searchBarFocusValue == 0) {
      _productSearchFocusNode.requestFocus();
    } else if (widget.searchBarFocusValue != null &&
        widget.searchBarFocusValue == 1) {
      _distributorFocusNode.requestFocus();
      widget.onDropDownOpenCallBackForDistributor?.call(true);
      appBarCubit.dropDownArrowTapped(isTapped: true);
      Future.delayed(const Duration(milliseconds: 100))
          .then((value) => openDropdown(context));
    }
    if (widget.searchContextModel != null) {
      if (widget.searchContextModel!.contextType.isNotEmpty) {
        contextType = widget.searchContextModel?.contextType ?? "";
        selectedDistributorId = widget.searchContextModel?.storeId ?? 0;
        selectedStoreName = widget.searchContextModel?.storeName ?? "";
        selectedCompanyName = widget.searchContextModel?.companyName ?? "";
        selectedCompanyId =
            widget.searchContextModel?.companyId.toString() ?? "";
        widget.productAndDistributorCallBack?.call(
            "",
            selectedDistributorId,
            selectedStoreName,
            selectedCompanyId,
            selectedCompanyName,
            contextType);
        if (selectedDistributorId != 0 && selectedStoreName != "") {
          distributorTextController.text = selectedStoreName;
        }
      }
    }

    super.initState();
    if (widget.type == AppBarType.secondaryAppBar) {
      AppConstants.dropDownHandler.listen((value) {
        appBarCubit.distributorTextFieldTapped(isTapped: false);
        widget.onDropDownOpenCallBackForDistributor?.call(false);
        _distributorFocusNode.unfocus();
        closeDropdown();
      });
    }
  }

  @override
  void dispose() {
    deInitDI();
    closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>();
    if (themeColors == null) {
      throw Exception('AppThemeColors extension not found in current theme');
    }
    if (widget.type == AppBarType.dashBoard) {
      return Container(
        decoration:
            const BoxDecoration(color: AppColors.appBarColor, boxShadow: [
          BoxShadow(
            color: Color.fromARGB(71, 175, 173, 173),
            offset: Offset(
              0,
              1,
            ),
            blurRadius: 0.1,
            spreadRadius: 0.1,
          ),
        ]),
        child: _buildSearchBarWithDrawer(),
      );
    } else if (widget.type == AppBarType.secondaryAppBar) {
      return Container(
        decoration:
            const BoxDecoration(color: AppColors.appBarColor, boxShadow: [
          BoxShadow(
            color: Color.fromARGB(71, 175, 173, 173),
            offset: Offset(
              0,
              1,
            ),
            blurRadius: 0.1,
            spreadRadius: 0.1,
          ),
        ]),
        child: _buildSearchBar(),
      );
    } else {
      return _buildSearchView(false, false, false);
    }
  }

  _buildSearchBar() {
    return widget.isInterActive
        ? _buildBody(widget.type == AppBarType.dashBoard)
        : Stack(
            children: [
              _buildBody(widget.type == AppBarType.dashBoard),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutePaths.searchProduct,
                            arguments: 0);
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutePaths.searchProduct,
                            arguments: 1);
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }

  _buildBody(bool isDashboard) {
    bool isDistributorActive = false;
    bool isProductActive = false;
    bool isItemSelected = false;
    return BlocBuilder<CustomAppBarCubit, CustomAppBarState>(
      bloc: appBarCubit,
      buildWhen: (previous, current) {
        return (current is StartDistributorSearch) ||
            (current is StartProductSearch) ||
            (current is DistributorSelectedState) ||
            (current is DropDownArrowTapped) ||
            (current is CloseDistributorDropdownState) ||
            (current is ResetState);
      },
      builder: (context, state) {
        if (state is StartDistributorSearch) {
          isDistributorActive = state.isStarted;
          isProductActive = !state.isStarted;
          isItemSelected = false;
        }

        if (state is StartProductSearch) {
          isProductActive = state.isStarted;
          isDistributorActive = !state.isStarted;
        }
        if (state is DistributorSelectedState) {
          isItemSelected = state.distributorSelected;
          isDistributorActive = false;
        }

        if (state is DropDownArrowTapped) {
          isDistributorActive = state.isTapped;
        }
        if (state is CloseDistributorDropdownState) {
          isDistributorActive = true;
          closeDropdown(isTapped: true);
        }

        if (state is ResetState) {
          productTextController.clear();
          isProductActive = false;
        }

        return Row(
          children: [
            isDashboard
                ? Container()
                : Container(
                    color: AppColors.appBarColor,
                    height: widget.preferredSize.height,
                    child: IconButton(
                        onPressed: () {
                          deInitDI();
                          closeDropdown();
                          if (selectedDistributorId != 0 &&
                              selectedStoreName != "") {
                            widget.productAndDistributorCallBack
                                ?.call("", 0, "", "", "", "");
                          }
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.blueButtonColor,
                        ))),
            Expanded(
              child: Container(
                color: AppColors.appBarColor,
                width: double.infinity,
                height: widget.preferredSize.height,
                child: InkWell(
                  onTap: () {
                    /// Navigate to search screen / merchandise screenews4es4re
                  },
                  child: _buildSearchView(
                      isItemSelected, isDistributorActive, isProductActive),
                ),
              ),
            ),
            !isDashboard // Add filter icon only if the AppBarType is not Dashboard
                ? Container(
                    height: widget.preferredSize.height,
                    color: AppColors.appBarColor,
                    child: IconButton(
                        onPressed: () {
                          widget.onFilterClick?.call();
                        },
                        icon: AppAssets.svg.icFilterSettings.svg()),
                  )
                : Container(),
          ],
        );
      },
    );
  }

  _buildSearchView(
      bool isItemSelected, bool isDistributorActive, bool isProductActive) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(
          top: 10,
          left: (widget.type == AppBarType.secondaryAppBar) ? 0.0 : 15,
          right: 12,
          bottom: 10),
      decoration: BoxDecoration(
          borderRadius: isItemSelected
              ? BorderRadius.circular(8)
              : isDistributorActive
                  ? const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    )
                  : BorderRadius.circular(8),
          color: AppColors.searchBackgroundColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        key: _widgetKey,
        children: [
          _buildIconAndTextField(
              controller: productTextController,
              imagePath: AppAssets.svg.icSearch,
              focusNode: _productSearchFocusNode,
              type: widget.page,
              hintText: widget.page == 'order_history'
                  ? context.localizedString.product
                  : context.localizedString.product,
              context: context,
              onTap: () {
                if (_overlayEntry != null) {
                  widget.onDropDownOpenCallBackForDistributor?.call(false);
                  closeDropdown();
                }
                appBarCubit.productTextFieldTapped(isTapped: true);
              },
              onTextTyped: (text) {
                widget.productAndDistributorCallBack?.call(
                    text,
                    selectedDistributorId,
                    distributorTextController.text,
                    selectedCompanyId,
                    selectedCompanyName,
                    contextType);
              },
              isIcon: isProductActive),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 21,
              width: 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white300),
            ),
          ),
          _buildIconAndTextField(
              controller: distributorTextController,
              type: widget.page,
              focusNode: _distributorFocusNode,
              imagePath: AppAssets.svg.icSearch,
              isDropDown: isDistributorActive,
              hintText: context.localizedString.distributor,
              context: context,
              onTap: () async {
                if (distributorTextController.text != '' &&
                    distributorTextController.text.contains('...')) {
                  distributorTextController.text = selectedStoreName;
                }

                widget.onDropDownOpenCallBackForDistributor?.call(true);

                appBarCubit.distributorTextFieldTapped(isTapped: true);

                openDropdown(context);
              },
              onTextTyped: (val) {
                distributorDropDownCubit.textFieldTyped(query: val);
              },
              isIcon: isItemSelected ? true : isDistributorActive),
        ],
      ),
    );
  }

  _buildSearchBarWithDrawer() {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: _buildSearchBar(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: AppColors.appBarColor,
            height: widget.preferredSize.height,
            child: Row(
              children: [
                InkWell(
                  onTap: widget.onPressNotifications,
                  child: AppAssets.svg.icNotification.svg(
                    semanticsLabel: 'Notifications',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void openDropdown(BuildContext context) {
    // get the position of the TextField widgets relative to the screen

    final RenderBox renderBox =
        _widgetKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    if (_overlayEntry != null) {
      closeDropdown();
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        //-1 and + 2 adjusting border for container.
        return CustomDropDown(
          position: position + Offset(0, renderBox.size.height),
          child: DistributorDropDownView(
            page: widget.page ?? '',
            cubit: distributorDropDownCubit,
            inputWidth: renderBox.size.width,
            getIdCallback: (id, storeName, companyId) {
              selectedStoreName = storeName;
              selectedDistributorId = id;
              closeDropdown(isTapped: true);
              widget.onDropDownOpenCallBackForDistributor?.call(true);
              widget.productAndDistributorCallBack?.call(
                  productTextController.text,
                  id,
                  storeName,
                  selectedCompanyId,
                  selectedCompanyName,
                  contextType);

              distributorTextController.text = storeName;

              _distributorFocusNode.unfocus();
              // appBarCubit.distributorTextFieldTapped(isTapped: false);
              appBarCubit.distributorSelected(isSelected: true);
            },
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  _buildIconAndTextField(
      {required TextEditingController controller,
      required String hintText,
      FocusNode? focusNode,
      required SvgGenImage imagePath,
      bool? isDropDown,
      required bool isIcon,
      Function()? onTap,
      required BuildContext context,
      String? type,
      Function(String)? onTextTyped}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            !isIcon && controller.text == ''
                ? imagePath.svg(
                    width: 16,
                    height: 16,
                  )
                : const SizedBox.shrink(),
            SizedBox(
              width: !isIcon && controller.text == '' ? 8 : 0,
            ),
            Expanded(
              child: TextField(
                //  enableSuggestions: false,
                // autocorrect: false,
                controller: controller,
                focusNode: focusNode,
                cursorColor: Colors.grey,
                style: AppTextStyles.searchTextStyle14W400(),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z-' ']")),
                ],
                //
                decoration: InputDecoration(
                  isDense: true,
                  hintText: isIcon ? "" : hintText,
                  hintStyle: type == 'order_history'
                      ? AppTextStyles.searchOrderHistoryHintTextStyleW700()
                      : AppTextStyles.searchHintTextStyleW400(),
                  contentPadding: const EdgeInsets.only(left: 0, bottom: 5),

                  // border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.start,
                onChanged: (text) {
                  EasyDebounce.debounce(
                      'appbar-debouncer',
                      const Duration(milliseconds: 500),
                      () => onTextTyped?.call(text));
                  setState(() {});
                },
                onTap: () {
                  onTap?.call();
                },
              ),
            ),
            isDropDown != null
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (isDropDown) {
                        widget.onDropDownOpenCallBackForDistributor
                            ?.call(false);
                        appBarCubit.dropDownArrowTapped(isTapped: false);
                        closeDropdown();
                      } else {
                        widget.onDropDownOpenCallBackForDistributor?.call(true);

                        appBarCubit.dropDownArrowTapped(isTapped: true);

                        openDropdown(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: isDropDown
                          ? AppAssets.svg.arrowUp.svg(height: 16, width: 16)
                          : AppAssets.svg.arrowDown.svg(height: 8, width: 8),
                    ))
                : controller.text.isNotEmpty
                    ? GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          getIt.get<CustomAppBarCubit>().resetAppBar();
                          getIt.get<SearchProductCubit>().emitInitialState();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child:
                              AppAssets.svg.cartClose.svg(height: 8, width: 8),
                        ))
                    : const SizedBox.shrink(),
            SizedBox(
              width: controller.text.isNotEmpty ? 0 : 8,
            ),
          ],
        ),
      ),
    );
  }

  void closeDropdown({isTapped = false}) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;

      if (!isTapped) {
        if (distributorTextController.text == '') {
          _distributorFocusNode.unfocus();
          widget.productAndDistributorCallBack?.call(productTextController.text,
              0, '', selectedCompanyId, selectedCompanyName, contextType);
        }
      }
    }
  }
}

enum AppBarType { dashBoard, secondaryAppBar, searchView }

/// Note : Appbar is going to be common widgets through out the app
/// Already app level common widgets folder structure is created once that PR
/// gets merged we will move this class to respective path
