import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/gen/fonts.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/processing_request_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/request_failed_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/success_custom_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/error_message_widget.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/title_and_value_row_item.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_rounder_corner_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/utils/retailer_utils.dart';
import 'package:pharmarack/view/features/search_product/di/search_product_providers.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/add_product_to_cart_cubit.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/add_product_to_cart_state.dart';
import 'package:pharmarack/view/features/widgets/dropdown/custom_drop_down.dart';

class AddDistributorsProductToCart extends StatefulWidget {
  final SearchProductListModel productDetails;

  const AddDistributorsProductToCart({
    super.key,
    required this.productDetails,
  });

  @override
  State<AddDistributorsProductToCart> createState() =>
      _AddDistributorsProductToCartState();
}

class _AddDistributorsProductToCartState
    extends State<AddDistributorsProductToCart> {
  late AddProductToCartCubit addProductToCartCubit;

  bool isDropdownOpen = false;

  final GlobalKey _widgetKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  TextEditingController distributorTextController = TextEditingController();

  final FocusNode _distributorFocusNode = FocusNode();
  double mrp = 0;
  double ptr = 0;
  String scheme = "";
  int stock = 0;

  @override
  void initState() {
    super.initState();
    intCartDI();
    _distributorFocusNode.unfocus();
    closeDropdown();
    addProductToCartCubit = getIt<AddProductToCartCubit>();
  }

  SearchProductListModel disProductDetails = SearchProductListModel(
    ptr: 0,
    mrp: 0,
    scheme: "",
    stock: 0,
  );

  @override
  Widget build(BuildContext context) {
    disProductDetails.id = 0;
    bool isDropDown = false;
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      surfaceTintColor: AppColors.dialogBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: BlocBuilder(
        bloc: addProductToCartCubit,
        builder: (context, state) {
          if (state is AddProductToCartLoadingState) {
            return const ProcessingRequestWidget();
          } else if (state is AddProductToCartDataState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: SuccessDialog(
                title: context.localizedString.success,
              ),
            );
          } else if (state is AddProductToCartErrorState) {
            return const RequestFailedWidget();
          } else {
            return Container(
              height: MediaQuery.of(context).size.height * 0.33,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        height: 33,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 10,
                                child: Text(
                                  widget.productDetails.productName ?? "",
                                  style: AppTextStyles.style16W400Black(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 1),
                                    child: AppAssets.svg.icClose.svg(
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        key: _widgetKey,
                        children: [
                          const Text(
                            "Distributor",
                            style: TextStyle(
                                fontSize: 12, color: AppColors.black38),
                          ),
                          Container(
                            height: 40,
                            margin: const EdgeInsets.only(
                                top: 5, left: 0, right: 10, bottom: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.searchBackgroundColor),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Expanded(
                                      child: TextField(
                                        //  enableSuggestions: false,
                                        // autocorrect: false,
                                        controller: distributorTextController,
                                        focusNode: _distributorFocusNode,
                                        // autofocus: true,
                                        cursorColor: Colors.grey,
                                        style: AppTextStyles
                                            .searchTextStyle14W400(),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: "Select Distributor",
                                          hintStyle: AppTextStyles
                                              .searchHintTextStyleW400(),
                                          contentPadding:
                                              const EdgeInsets.all(5),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        textAlign: TextAlign.start,
                                        onChanged: (text) {
                                          EasyDebounce.debounce(
                                              'appbar-debouncer',
                                              const Duration(milliseconds: 500),
                                              () => {});
                                        },
                                        // onTapOutside: (event) {
                                        //   closeDropdown();
                                        // },
                                        onSubmitted: (event) {
                                          closeDropdown();
                                        },
                                        onTap: () async {
                                          closeDropdown();
                                          await Future.delayed(
                                              const Duration(seconds: 2));
                                          openDropdown(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  isDropDown != null
                                      ? GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: isDropDown == true
                                                ? AppAssets.svg.arrowUp
                                                    .svg(height: 16, width: 16)
                                                : AppAssets.svg.arrowDown
                                                    .svg(height: 8, width: 8),
                                          ))
                                      : const SizedBox.shrink(),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            TitleAndAmountRowItem(
                                title: context.localizedString.ptr,
                                value: disProductDetails.ptr != 0
                                    ? disProductDetails.ptr.toString()
                                    : "-"),
                            const SizedBox(
                              width: 10,
                            ),
                            TitleAndAmountRowItem(
                                title: context.localizedString.mrp,
                                value: disProductDetails.mrp != 0
                                    ? disProductDetails.mrp.toString()
                                    : "-"),
                            const SizedBox(
                              width: 10,
                            ),
                            disProductDetails.stock != null
                                ? disProductDetails.stock == 0
                                    ? TitleAndAmountRowItem(
                                        title:
                                            context.localizedString.stockValue,
                                        value: disProductDetails.stock != 0
                                            ? disProductDetails.stock.toString()
                                            : "-",
                                        textColor: AppColors.lightGrey,
                                      )
                                    : TitleAndAmountRowItem(
                                        title:
                                            context.localizedString.stockValue,
                                        value: disProductDetails.stock != 0
                                            ? disProductDetails.stock.toString()
                                            : "-",
                                        textColor: AppColors.primaryGreenColor,
                                      )
                                : const SizedBox(),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Text(
                                      "${context.localizedString.scheme}:",
                                      style: AppTextStyles.style11W500MedGrey(
                                        color: AppColors.lightGrey,
                                      ),
                                    ),
                                  ),
                                  disProductDetails.scheme != ""
                                      ? Card(
                                          color: AppColors.primaryOrangeColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            child: Text(
                                              disProductDetails.scheme
                                                  .toString(),
                                              style: AppTextStyles
                                                  .style11W500MedGrey(
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5, top: 5),
                                          child: Text(
                                            "-",
                                            style: AppTextStyles
                                                .style11W500MedGrey(
                                              color: AppColors.lightGrey,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      addQuantityView(context),
                      defaultCountRow(),
                    ]),
              ),
            );
          }
        },
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
                    scheme != null ||
                            scheme != "" && widget.productDetails.qty != null
                        ? BlocBuilder(
                            bloc: addProductToCartCubit,
                            buildWhen: (previous, current) {
                              return (current is FreeValueUpdateState);
                            },
                            builder: (context, state) {
                              if (state is FreeValueUpdateState) {
                                return RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: context.localizedString.free,
                                      style: kIsWeb
                                          ? context.textStyles.header6Regular
                                              ?.copyWith(
                                              color: AppColors.lightGrey,
                                            )
                                          : AppTextStyles.style12W700Black(
                                              color: AppColors.lightGrey,
                                              fontWeight: FontWeight.w100,
                                            )),
                                  TextSpan(
                                      text: ": ",
                                      style: kIsWeb
                                          ? context.textStyles.header6Regular
                                              ?.copyWith(
                                              color: AppColors.lightGrey,
                                            )
                                          : AppTextStyles.style12W700Black(
                                              color: AppColors.lightGrey,
                                              fontWeight: FontWeight.w100,
                                            )),
                                  TextSpan(
                                      text: RetailerUtils
                                          .getFreeTabletsCountAsPerScheme(
                                        disProductDetails.scheme,
                                        state.quantity,
                                      ).toString(),
                                      style: kIsWeb
                                          ? context.textStyles.header6Bold
                                              ?.copyWith(
                                              fontFamily: AppFontFamily
                                                  .helveticaNeueRegular,
                                              color:
                                                  AppColors.primaryOrangeColor,
                                            )
                                          : AppTextStyles.style11W500MedGrey(
                                              color:
                                                  AppColors.primaryOrangeColor,
                                            ).copyWith(
                                              fontWeight: FontWeight.w100)),
                                ]));
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
                                  key: addProductToCartCubit.formKey,
                                  child: TextFormField(
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
                                      addProductToCartCubit
                                          .updateFreeValue(int.parse(value));
                                      if (value.isNotEmpty) {
                                        addProductToCartCubit
                                            .resetQuantityField();
                                      }
                                    },
                                    onTap: () {
                                      closeDropdown();
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
                                  productDetails: disProductDetails,
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

  Widget defaultCountRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => {
              addProductToCartCubit.quantityController.text = "30",
              addProductToCartCubit.updateFreeValue(int.parse("30")),
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadowColor: Colors.transparent,
              color: const Color(0XFFE4E9FA),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Text(
                  "30",
                  style: TextStyle(color: AppColors.blueButtonColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          InkWell(
            onTap: () => {
              addProductToCartCubit.quantityController.text = "50",
              addProductToCartCubit.updateFreeValue(int.parse("50")),
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadowColor: Colors.transparent,
              color: const Color(0XFFE4E9FA),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Text(
                  "50",
                  style: TextStyle(color: AppColors.blueButtonColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          InkWell(
            onTap: () => {
              addProductToCartCubit.quantityController.text = "100",
              addProductToCartCubit.updateFreeValue(int.parse("100")),
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadowColor: Colors.transparent,
              color: const Color(0XFFE4E9FA),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Text(
                  "100",
                  style: TextStyle(color: AppColors.blueButtonColor),
                ),
              ),
            ),
          ),
        ],
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
        }
      }
    }
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
            position: position + Offset(0, renderBox.size.height - 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  border: Border.all(width: 1, color: AppColors.white300)),
              width: renderBox.size.width - 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 0,
                    ),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minHeight: 50, maxHeight: 294),
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    disProductDetails.mrp = 20.2;
                                    disProductDetails.ptr = 20.2;
                                    disProductDetails.scheme = "20+2";
                                    disProductDetails.stock = 300;
                                  });
                                  distributorTextController.text =
                                      "Pradeep Distributors";
                                  closeDropdown();
                                  _distributorFocusNode.unfocus();
                                },
                                child: Container(
                                    margin: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: AppColors.white300),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Pradeep Distributors"),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: context
                                                          .localizedString.ptr,
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.black38,
                                                          fontSize: 12),
                                                    ),
                                                    const WidgetSpan(
                                                      child: Icon(
                                                          Icons
                                                              .currency_rupee_rounded,
                                                          color: AppColors
                                                              .blackTextFieldText,
                                                          size: 14),
                                                    ),
                                                    TextSpan(
                                                      // text: productItem.ptr != ""
                                                      //     ? double.parse(productItem.ptr!)
                                                      //         .toStringAsFixed(2) : "0.0"
                                                      text: "0.0",
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .blackTextFieldText,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: context
                                                          .localizedString.mrp,
                                                      style: const TextStyle(
                                                          color:
                                                              AppColors.black38,
                                                          fontSize: 12),
                                                    ),
                                                    const WidgetSpan(
                                                      child: Icon(
                                                          Icons.currency_rupee,
                                                          color: AppColors
                                                              .blackTextFieldText,
                                                          size: 14),
                                                    ),
                                                    TextSpan(
                                                      // text: productItem.mrp != ""
                                                      //     ? double.parse(productItem.mrp!)
                                                      //         .toStringAsFixed(2)
                                                      //     : "0.0",
                                                      text: "0.0",
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .blackTextFieldText,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: context
                                                          .localizedString
                                                          .stock,
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .green600,
                                                          fontSize: 12),
                                                    ),
                                                    TextSpan(
                                                      // text: productItem.stock.toString(),
                                                      text: "0.0",
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .green600,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      context.localizedString
                                                          .scheme,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      color: const Color(
                                                          0XFFFF7E00),
                                                      child: const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    5.0),
                                                        child: Text(
                                                          "10+2",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  void dispose() {
    deIntCartDI();
    closeDropdown();
    super.dispose();
  }
}
