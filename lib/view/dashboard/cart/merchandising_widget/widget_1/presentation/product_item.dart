import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/product_list_item/product_list_item.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/widget_1/cubit/product_item_cubit.dart';
import 'package:pharmarack/view/features/search_product/di/search_product_providers.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/widgets/add_product_to_cart_popup.dart';

import '../domain/product_model.dart';

class ProductItem extends StatefulWidget {
  final String? title;

  const ProductItem({super.key, this.title});

  @override
  State<ProductItem> createState() => _TopPickWidgetState();
}

class _TopPickWidgetState extends State<ProductItem> {
  List<SearchProductListModel> _availableProduct = [];
  late final String yourTopPicks;
  late final String viewMoreLink;

  @override
  void initState() {
    super.initState();
    initStockiestDI();
    intProductDI();
    loadYouPicksItem();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadYouPicksItem() async {
    final res =
        await rootBundle.loadString('assets/mockData/your_top_picks.json');
    final productData =
        ProductModel.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      yourTopPicks = productData.data!.headline!;
      viewMoreLink = productData.data!.viewAllLink!;
      _availableProduct = productData.data!.product!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_availableProduct.isEmpty)
        ? const Center(
            child: SpinKitFadingCircle(
              color: AppColors.blueButtonColor,
              size: 50.0,
            ),
          )
        : BlocProvider<ProductItemCubit>(
            create: (context) => getIt<ProductItemCubit>(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title ?? yourTopPicks,
                        style: context.textStyles.header4Medium?.copyWith(
                          color: context.colors.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Visibility(
                      visible: widget.title != null ? false : true,
                      child: InkWell(
                        onTap: () {
                          if (viewMoreLink.isNotEmpty) {
                            Navigator.pushNamed(
                                context, RoutePaths.orderHistory);
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              context.localizedString.viewMore,
                              style:
                                  context.textStyles.header9Regular?.copyWith(
                                color: context.colors.primary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              padding: const EdgeInsets.only(left: 5),
                              child: AppAssets.svg.arrowRight.svg(
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _availableProduct.map((product) {
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ProductListItem(
                        productName: product.productName,
                        storeName: product.storeName,
                        company: product.company,
                        ptr: product.ptr,
                        mrp: product.mrp,
                        stock: product.stock,
                        margin: product.margin,
                        scheme: product.scheme,
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
                    );
                  }).toList(),
                ),
              ],
            ),
          );
  }
}
