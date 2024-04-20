import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/product_list_item/product_list_item.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/utils/extensions.dart';
import 'package:pharmarack/view/features/change_distributor/presentation/widget/change_distributor_dialog_card.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/pageConfigModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/ProductListModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/TopWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/TopWidgets/TopWidgets.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';

import '../../../../search_product/presentation/pages/widgets/add_product_to_cart_popup.dart';

Future<ProductsItemList> _loadProductsWidget(List<dynamic>? children) async {
  try {
    if (children!.isNotEmpty) {
      return ProductsItemList.fromJson(children);
    } else {
      return ProductsItemList(products: []);
    }
  } catch (error) {
    rethrow;
  }
}

class ProductsWidget extends StatefulWidget {
  final TopWidgetModel productsWidgetData;

  const ProductsWidget({super.key, required this.productsWidgetData});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  late PageConfigModel pageConfigModel;

  @override
  void initState() {
    super.initState();
    pageConfigModel = getIt<PageConfigModel>();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadProductsWidget(widget.productsWidgetData.data),
        builder: (context, AsyncSnapshot<ProductsItemList> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            ProductsItemList productsItems = snapshot.requireData;
            if (pageConfigModel.page == "company_page") {
              return productsItems.products.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          topTitleWidget(widget.productsWidgetData, context),
                          companyProductListWidget(
                              context, productsItems.products),
                        ],
                      ),
                    )
                  : Container();
            } else {
              return productsItems.products.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          topTitleWidget(widget.productsWidgetData, context),
                          productListWidget(context, productsItems.products),
                        ],
                      ),
                    )
                  : Container();
            }
          } else {
            return Container();
          }
        });
  }
}

Widget productListWidget(
    BuildContext context, List<ProductListModel> productsItems) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: productsItems.asMap().entries.map((entry) {
      ProductListModel productItem = entry.value;
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: const Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(15),
          border: Border(
            top: const BorderSide(color: Color(0XFFE2E4E9), width: 1.0),
            left: const BorderSide(color: Color(0XFFE2E4E9), width: 1.0),
            right: const BorderSide(color: Color(0XFFE2E4E9), width: 1.0),
            bottom: productItem.cashbackMessage != null ||
                    productItem.cashbackMessage != ""
                ? const BorderSide(color: Color(0XFFE2E4E9), width: 1.0)
                : BorderSide.none,
          ),
        ),
        child: ProductListItem(
          productName: productItem.productName,
          //MOVP  productName
          mrp: productItem.mrp,
          qty: productItem.qty,
          storeName: productItem.storeName,
          ptr: productItem.ptr,
          company: productItem.companyName,
          //MOVP  company
          stock: productItem.stock,
          // margin: productItem.margin,
          //expiryDate: productItem.expiryDate,
          // storeProductGST: productItem.storeProductGST,
          scheme: productItem.scheme!.isNotEmpty ? productItem.scheme : 'NA',
          cashbackMessage: productItem.cashbackMessage,
          //rStockVisibility: productItem.rStockVisibility,
          // packing: productItem.packing,
          plusButtonTapped: () {
            showDialog(
              context: context,
              builder: (context) {
                SearchProductListModel data = SearchProductListModel(
                    id: productItem.productId ?? 0,
                    productCode: productItem.productCode,
                    storeId: productItem.storeId,
                    productName: productItem.productName ?? "",
                    storeName: productItem.storeName ?? "",
                    company: productItem.companyName ?? "",
                    ptr: productItem.ptr! ?? 0.0,
                    mrp: productItem.mrp! ?? 0.0,
                    stock: productItem.stock ?? 0,
                    margin: 0.0,
                    scheme: productItem.scheme ?? "",
                    stepUpValue: 0,
                    qty: 0);
                return AddProductToCartPopup(
                  productDetails: data,
                );
              },
            );
          },
        ),
      );
    }).toList(),
  );
}

Widget companyProductListWidget(context, List<ProductListModel> productsItems) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: productsItems.asMap().entries.map((entry) {
      ProductListModel productItem = entry.value;
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: const Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(15),
          border: Border(
            top: const BorderSide(color: Color(0XFFE2E4E9), width: 1.0),
            left: const BorderSide(color: Color(0XFFE2E4E9), width: 1.0),
            right: const BorderSide(color: Color(0XFFE2E4E9), width: 1.0),
            bottom: productItem.cashbackMessage != null ||
                    productItem.cashbackMessage != ""
                ? const BorderSide(color: Color(0XFFE2E4E9), width: 1.0)
                : BorderSide.none,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      productItem.productName != null
                                          ? TextSpan(
                                              text: productItem.productName!
                                                      .toTitleCase() ??
                                                  "",
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : TextSpan(),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "PTR:",
                                          style: TextStyle(
                                              color: AppColors.black38,
                                              fontSize: 12),
                                        ),
                                        const WidgetSpan(
                                          child: Icon(
                                              Icons.currency_rupee_rounded,
                                              color:
                                                  AppColors.blackTextFieldText,
                                              size: 14),
                                        ),
                                        TextSpan(
                                          text: productItem.ptr != null
                                              ? productItem.ptr!
                                                  .toStringAsFixed(2)
                                              : "0.0",
                                          style: const TextStyle(
                                              color:
                                                  AppColors.blackTextFieldText,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "MRP:",
                                          style: TextStyle(
                                              color: AppColors.black38,
                                              fontSize: 12),
                                        ),
                                        const WidgetSpan(
                                          child: Icon(Icons.currency_rupee,
                                              color:
                                                  AppColors.blackTextFieldText,
                                              size: 14),
                                        ),
                                        TextSpan(
                                          text: productItem.mrp != ""
                                              ? productItem.mrp!
                                                  .toStringAsFixed(2)
                                              : "0.0",
                                          style: const TextStyle(
                                              color:
                                                  AppColors.blackTextFieldText,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return ChangeDistributorDialogCard(
                                        productCode:
                                            productItem.productId.toString(),
                                        storeId: productItem.companyId!,
                                      );
                                    },
                                  ),
                                },
                                child: Card(
                                  color: AppColors.cardRectangleColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.blueLinkTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                productItem.cashbackMessage != null
                    ? Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(15),
                              bottomStart: Radius.circular(15)),
                          color: Color(0xffFEE6D0),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Text(
                            productItem.cashbackMessage ?? "",
                            style: const TextStyle(
                                color: Color(0XFFFF7E00),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : Container(),
              ]),
        ),
      );
    }).toList(),
  );
}
