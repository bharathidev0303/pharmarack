import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/processing_request_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/request_failed_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/success_custom_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/error_message_widget.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/title_and_value_row_item.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_rounder_corner_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/utils/retailer_utils.dart';
import 'package:pharmarack/view/features/change_distributor/presentation/widget/purchase_details_row.dart';
import 'package:pharmarack/view/features/search_product/di/search_product_providers.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/add_product_to_cart_cubit.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/add_product_to_cart_state.dart';

class AddProductToCartPopup extends StatefulWidget {
  final SearchProductListModel productDetails;

  const AddProductToCartPopup({
    super.key,
    required this.productDetails,
  });

  @override
  State<AddProductToCartPopup> createState() => _AddProductToCartPopupState();
}

class _AddProductToCartPopupState extends State<AddProductToCartPopup> {
  late AddProductToCartCubit addProductToCartCubit;
  var schemeList = [];
  int selectedScheme = -1;

  @override
  void initState() {
    super.initState();
    intCartDI();
    addProductToCartCubit = getIt<AddProductToCartCubit>();
    if (widget.productDetails.existingQty != null &&
        widget.productDetails.existingQty != 0) {
      addProductToCartCubit.quantityController.text =
          widget.productDetails.existingQty.toString();
    }
    if (widget.productDetails.scheme != null &&
        widget.productDetails.scheme!.isNotEmpty) {
      widget.productDetails.scheme!.split(',').forEach((tag) {
        schemeList.add(tag);
      });
    }
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
        buildWhen: (previous, current) {
          return current is QuantityValidatorState ||
              current is ResetQuantityValidatorState ||
              current is AddProductToCartLoadingState ||
              current is AddProductToCartDataState ||
              current is AddProductToCartErrorState;
        },
        builder: (context, state) {
          if (state is AddProductToCartLoadingState) {
            return const ProcessingRequestWidget();
          } else if (state is AddProductToCartDataState) {
            Future.delayed(const Duration(seconds: 2))
                .then((value) => Navigator.pop(context));
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
              child: SuccessDialog(
                hideCloseIcon: true,
                title: context.localizedString.success,
              ),
            );
          } else if (state is AddProductToCartErrorState) {
            return const RequestFailedWidget();
          } else {
            String errorMessage = "";
            Color borderColor = Colors.transparent;

            if (state is QuantityValidatorState) {
              borderColor = Colors.red;
              errorMessage = state.errorMessage;
            }

            return Container(
              height: schemeList.isNotEmpty
                  ? MediaQuery.of(context).size.height * 0.32
                  : errorMessage.isNotEmpty
                      ? errorMessage.length > 60
                          ? MediaQuery.of(context).size.height * 0.35
                          : MediaQuery.of(context).size.height * 0.32
                      : MediaQuery.of(context).size.height * 0.26,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              widget.productDetails.productName ?? "",
                              style: AppTextStyles.style16W400Black(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              margin: const EdgeInsets.only(top: 1),
                              child: AppAssets.svg.icClose.svg(
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.productDetails.storeName != null &&
                                    widget.productDetails.storeName != ''
                                ? Container(
                                    constraints: BoxConstraints(
                                        minWidth: 30,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.3),
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                    ),
                                    child: Text(
                                      widget.productDetails.storeName!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppTextStyles.style12W500Black(
                                        color: AppColors.textBlueColor,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            widget.productDetails.storeName != null &&
                                    widget.productDetails.storeName != ''
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: AppAssets.svg.blueArrowUpRight
                                        .svg(height: 12, width: 12),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              width: 10,
                            ),
                            widget.productDetails.company != null &&
                                    widget.productDetails.company != ''
                                ? Container(
                                    constraints: BoxConstraints(
                                        minWidth: 30,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.3),
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                    ),
                                    child: Text(
                                      widget.productDetails.company ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppTextStyles.style12W500Black(
                                        color: AppColors.textBlueColor,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            widget.productDetails.company != null &&
                                    widget.productDetails.company != ''
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: AppAssets.svg.blueArrowUpRight
                                        .svg(height: 12, width: 12),
                                  )
                                : const SizedBox.shrink(),
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: FittedBox(
                          child: PurchaseDetailsRow(
                            ptr: widget.productDetails.ptr,
                            mrp: widget.productDetails.mrp,
                            stockQuantity: widget.productDetails.stock,
                            scheme: schemeList.isNotEmpty
                                ? schemeList[0]
                                : widget.productDetails.scheme,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      addQuantityView(context, errorMessage, borderColor),
                      SizedBox(
                        height: schemeList.isNotEmpty ? 10 : 0,
                      ),
                      schemeList.isNotEmpty
                          ? SizedBox(
                              height: 32,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: schemeList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedScheme = index;
                                      addProductToCartCubit
                                              .quantityController.text =
                                          schemeList[index]
                                              .toString()
                                              .split('+')[0];
                                      addProductToCartCubit
                                          .resetQuantityField();
                                      addProductToCartCubit.updateFreeValue(
                                          int.parse(schemeList[index]
                                              .toString()
                                              .split('+')[0]));
                                      // setState(() {
                                      // });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: AppColors.secondaryButtonColor,
                                          border: selectedScheme == index
                                              ? Border.all(
                                                  color: AppColors
                                                      .secondaryButtonTextColor)
                                              : null),
                                      //height: 30,
                                      width: 70,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Center(
                                        child: /*Text(
                                    schemeList[index],
                                    style: context.textStyles.header12Medium?.copyWith(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  )*/
                                            RichText(
                                          text: TextSpan(
                                            text:
                                                '${schemeList[index].toString().split('+')[0]} + ',
                                            style: AppTextStyles
                                                .textFieldNameStyle11W500
                                                .copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    ' ${schemeList[index].toString().split('+')[1]}',
                                                style: AppTextStyles
                                                    .textFieldNameStyle11W500
                                                    .copyWith(
                                                  color: AppColors
                                                      .primaryOrangeColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox.shrink()
                    ]),
              ),
            );
          }
        },
      ),
    );
  }

  Widget addQuantityView(
      BuildContext context, String errorMessage, Color borderColor) {
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
                    widget.productDetails.scheme != null &&
                            widget.productDetails.scheme != ""
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
                                    widget.productDetails.scheme,
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
              Row(
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
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9a-zA-Z]")),
                                ],
                                //
                                controller:
                                    addProductToCartCubit.quantityController,
                                autofocus: true,
                                decoration: InputDecoration(
                                  fillColor: AppColors.lightGreyTextField,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: borderColor),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    value = '0';
                                    selectedScheme = -1;
                                  }
                                  addProductToCartCubit.resetQuantityField();
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
                          doClickAddProduct(context);
                        }),
                  )
                ],
              )
              // BlocBuilder(
              //   bloc: addProductToCartCubit,
              //   buildWhen: (previous, current) {
              //     return current is QuantityValidatorState ||
              //         current is ResetQuantityValidatorState;
              //   },
              //   builder: (context, state) {
              //     String errorMessage = "";
              //     Color borderColor = Colors.transparent;
              //
              //     if (state is QuantityValidatorState) {
              //       borderColor = Colors.red;
              //       errorMessage = state.errorMessage;
              //     }
              //
              //     return Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Flexible(
              //           child: Column(
              //             children: [
              //               SizedBox(
              //                   height: 40,
              //                   child: Form(
              //                     key: addProductToCartCubit.formKey,
              //                     child: TextFormField(
              //                       inputFormatters: <TextInputFormatter>[
              //                         FilteringTextInputFormatter.allow(
              //                             RegExp("[0-9a-zA-Z]")),
              //                       ],
              //                       //
              //                       controller: addProductToCartCubit
              //                           .quantityController,
              //                       autofocus: true,
              //                       decoration: InputDecoration(
              //                         fillColor: AppColors.lightGreyTextField,
              //                         filled: true,
              //                         focusedBorder: OutlineInputBorder(
              //                           borderSide:
              //                               BorderSide(color: borderColor),
              //                         ),
              //                       ),
              //                       onChanged: (value) {
              //                         if (value.isEmpty) {
              //                           value = '0';
              //                           selectedScheme = -1;
              //                         }
              //                         addProductToCartCubit
              //                             .resetQuantityField();
              //                         addProductToCartCubit
              //                             .updateFreeValue(int.parse(value));
              //                       },
              //                       keyboardType: TextInputType.number,
              //                     ),
              //                   )),
              //               errorMessage != ""
              //                   ? ErrorMessageWidget(
              //                       errorMessage: errorMessage,
              //                     )
              //                   : const SizedBox.shrink()
              //             ],
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         SizedBox(
              //           height: 40,
              //           //   margin: const EdgeInsets.only(top: 20),
              //           child: PrimaryRoundedCornerButton(
              //               text: context.localizedString.addCaps,
              //               color: errorMessage != ""
              //                   ? AppColors.secondaryGreyedOutColor
              //                   : AppColors.secondaryColor,
              //               cornerRadius: 5.0,
              //               onTap: () {
              //                 doClickAddProduct(context);
              //               }),
              //         )
              //       ],
              //     );
              //   },
              // ),
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
              addProductToCartCubit.updateFreeValue(30),
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
              addProductToCartCubit.updateFreeValue(50),
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
              addProductToCartCubit.updateFreeValue(100),
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

  @override
  void dispose() {
    deIntCartDI();
    super.dispose();
  }

  void doClickAddProduct(BuildContext context) {
    addProductToCartCubit.validateQuantityField(
        productDetails: widget.productDetails,
        quantity: addProductToCartCubit.quantityController.text,
        context: context);
  }
}
