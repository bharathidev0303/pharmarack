import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/product_list_item/product_list_item.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';

/// This class [SearchProductPageWebView] which specifically used to render Web UI
class SearchProductPageWebView extends StatelessWidget {
  final List<SearchProductListModel> productList;
  const SearchProductPageWebView({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          final product = productList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ProductListItem(
              productName: product.productName,
              mrp: product.mrp,
              qty: product.qty,
              storeName: product.storeName,
              ptr: product.ptr,
              company: product.company,
              stock: product.stock,
            ),
          );
        },
      ),
    );
  }
}
