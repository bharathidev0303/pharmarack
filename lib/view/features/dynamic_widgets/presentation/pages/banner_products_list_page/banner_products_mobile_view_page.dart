import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/utils/extensions.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/banner_products_list_page_provider.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/banner_products_list_page/banner_products_list_page_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/BannerProductsList.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/banner_products_list_page/banner_product_list.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/company_page/company_screen_page.dart';
import 'package:pharmarack/view/features/search_product/di/search_product_providers.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/widgets/add_product_to_cart_popup.dart';

class BannerProductsMobileViewPage extends StatefulWidget {
  final String tittle;
  final String productIds;

  const BannerProductsMobileViewPage(
      {super.key, required this.tittle, required this.productIds});

  @override
  State<BannerProductsMobileViewPage> createState() =>
      _BannerProductsMobileViewPageState();
}

class _BannerProductsMobileViewPageState
    extends State<BannerProductsMobileViewPage> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    clearBannerProductsListDi();
    initBannerProductsListDi();
    bannerProductsListCubit.fetchBannerProductsList(
        productIds: widget.productIds);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RefreshIndicator(
        key: refreshIndicatorKey,
        color: AppColors.blueButtonColor,
        onRefresh: () => _refreshPage(context),
        child: BlocBuilder(
          bloc: bannerProductsListCubit,
          buildWhen: (previous, current) {
            return (current is BannerProductsListInitialState) ||
                (current is BannerProductsListLoadingState) ||
                (current is BannerProductsListErrorState) ||
                (current is BannerProductsListDataState);
          },
          builder: (context, state) {
            if (state is BannerProductsListLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BannerProductsListErrorState) {
              return Center(
                child: Container(
                  child: AppAssets.svg.icInfoCircleError
                      .svg(width: 30, height: 30),
                ),
              );
            } else if (state is BannerProductsListDataState) {
              return SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Products",
                                  style: TextStyle(
                                      color: Color(0XFF9193A1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                  buildProductsItems(state.bannerProductsList),
                ]),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildProductsItems(List<BannerProductsList> productsItems) {
    if (productsItems!.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: productsItems!.asMap().entries.map((entry) {
          int index = entry.key;
          BannerProductsList productItem = entry.value;

          if (productItem.companyName == null ||
              productItem.companyName == "") {
            productItem.companyName = "Anand Medical Distributors";
          }

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
                      padding: const EdgeInsets.all(10.0),
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
                                          productItem.productName != null ||
                                                  productItem.productName != ""
                                              ? TextSpan(
                                                  text: productItem.productName!
                                                          .toTitleCase() ??
                                                      "",
                                                  style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              : TextSpan(),
                                          const WidgetSpan(
                                            child: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  AppColors.blueLinkTextColor,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          CompaniesModel compModel =
                                              CompaniesModel(
                                                  companyName:
                                                      productItem.companyName);
                                          if (getIt
                                              .isRegistered<CompaniesModel>()) {
                                            getIt.unregister<CompaniesModel>();
                                            getIt.registerLazySingleton<
                                                    CompaniesModel>(
                                                () => compModel);
                                          } else {
                                            getIt.registerLazySingleton<
                                                    CompaniesModel>(
                                                () => compModel);
                                          }
                                          ;
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CompanyScreenPage()),
                                          );
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              productItem.companyName != null ||
                                                      productItem.companyName !=
                                                          ""
                                                  ? TextSpan(
                                                      text: productItem
                                                              .companyName!
                                                              .toTitleCase() ??
                                                          "",
                                                      style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: AppColors
                                                            .blueLinkTextColor,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  : TextSpan(),
                                              const WidgetSpan(
                                                child: Icon(
                                                    Icons.arrow_outward_rounded,
                                                    color: AppColors
                                                        .blueLinkTextColor,
                                                    size: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      // RichText(
                                      //   text: TextSpan(
                                      //     children: [
                                      //       TextSpan(
                                      //         text:
                                      //             productItem.company,
                                      //         style: const TextStyle(
                                      //             color: AppColors
                                      //                 .blueLinkTextColor,
                                      //             fontSize: 14),
                                      //       ),
                                      //       const WidgetSpan(
                                      //         child: Icon(
                                      //             Icons
                                      //                 .arrow_outward_rounded,
                                      //             color: AppColors
                                      //                 .blueLinkTextColor,
                                      //             size: 16),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
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
                                                  color: AppColors
                                                      .blackTextFieldText,
                                                  size: 14),
                                            ),
                                            TextSpan(
                                              text: productItem.ptr == null ||
                                                      productItem.ptr == ""
                                                  ? "0.0"
                                                  : double.parse(
                                                          productItem.ptr!)
                                                      .toStringAsFixed(2),
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .blackTextFieldText,
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
                                                  color: AppColors
                                                      .blackTextFieldText,
                                                  size: 14),
                                            ),
                                            TextSpan(
                                              text: productItem.mrp == "" ||
                                                      productItem.mrp == null
                                                  ? "0.0"
                                                  : double.parse(
                                                          productItem.mrp!)
                                                      .toStringAsFixed(2),
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .blackTextFieldText,
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
                                              text: "Stock: ",
                                              style: TextStyle(
                                                  color: AppColors.green600,
                                                  fontSize: 12),
                                            ),
                                            TextSpan(
                                              text: productItem.stock == null ||
                                                      productItem.stock == ""
                                                  ? "-"
                                                  : productItem.stock
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: AppColors.green600,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            )
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
                                  productItem.scheme == null ||
                                          productItem.scheme == ""
                                      ? Container()
                                      : Card(
                                          color: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              productItem.scheme.toString() ??
                                                  "",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                  InkWell(
                                    onTap: () => {
                                      intProductDI(),
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          SearchProductListModel data =
                                              SearchProductListModel(
                                            id: productItem.storeId ?? 0,
                                            productCode:
                                                productItem.productCode,
                                            storeId: productItem.storeId,
                                            productName:
                                                productItem.productName ?? "",
                                            storeName: "" ?? "",
                                            company:
                                                productItem.companyName ?? "",
                                            ptr: double.parse(
                                                    productItem.ptr!) ??
                                                0.0,
                                            mrp: double.parse(
                                                    productItem.mrp!) ??
                                                0.0,
                                            stock: productItem.stock ?? 0,
                                            margin: 0.0 ?? 0.0,
                                            scheme: productItem.scheme ?? "",
                                          );
                                          return AddProductToCartPopup(
                                            productDetails: data,
                                          );
                                        },
                                      )
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
                    productItem.cashbackMessage == null ||
                            productItem.cashbackMessage == ""
                        ? Container()
                        : Container(
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
                          ),
                  ]),
            ),
          );
        }).toList(),
      );
    } else {
      return Center(
        child: AppAssets.png.noRecordsFound.image(),
      );
    }
  }

  Future<void> _refreshPage(context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (a, b, c) => BannerProductsListPage(
                tittle: widget.tittle,
                productIds: widget.productIds,
              )),
    );
    return;
  }

  @override
  void dispose() {
    super.dispose();
    clearBannerProductsListDi();
  }
}
