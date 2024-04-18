import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/offers_and_rewards/model/top_savings_model.dart';

class TopSavingsList extends StatefulWidget {
  const TopSavingsList({super.key, required this.json});

  final String json;

  @override
  State<TopSavingsList> createState() => _TopSavingsState();
}

class _TopSavingsState extends State<TopSavingsList> {
  List<TopSavings> _availableProducts = [];
  @override
  void initState() {
    super.initState();
    loadTopSavings();
  }

  void loadTopSavings() async {
    final res = await rootBundle.loadString(widget.json);
    final productData =
        TopSavingsModel.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      _availableProducts = productData.topSavings!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _availableProducts.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: _availableProducts
                .map((product) => TopSavingsItems(
                    product, AppColors.topsavingsbg, Colors.blue))
                .toList());
  }
}

// ignore: must_be_immutable
class TopSavingsItems extends StatelessWidget {
  TopSavings product;
  Color bgColor, fgColor;
  TopSavingsItems(this.product, this.bgColor, this.fgColor, {super.key});

  @override
  Widget build(BuildContext context) {
    fgColor = int.parse('${product.id}') % 2 == 0 ? Colors.orange : Colors.blue;
    bgColor = int.parse('${product.id}') % 2 == 0
        ? AppColors.topsavingsbg
        : AppColors.secondaryOrangeColor;
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 0.0),
        child: Expanded(
          flex: 1,
          child: SizedBox(
            height: 150.0,
            child: Card(
                elevation: 0.0,
                color: bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill),
                    ),
                  ),
                  placeholder: (context, url) => const SizedBox(
                    width: 10,
                    height: 20,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),

                  // child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Row(
                  //       children: <Widget>[
                  //         Expanded(
                  //           flex: 2,
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: <Widget>[
                  //               Expanded(
                  //                 child: CachedNetworkImage(
                  //                   width: 47,
                  //                   height: 63,
                  //                   imageUrl: product.companyUrl ?? "",
                  //                   imageBuilder: (context, imageProvider) =>
                  //                       Container(
                  //                     decoration: BoxDecoration(
                  //                       image: DecorationImage(
                  //                           image: imageProvider, fit: BoxFit.fill),
                  //                     ),
                  //                   ),
                  //                   placeholder: (context, url) => const SizedBox(
                  //                     width: 10,
                  //                     height: 20,
                  //                     child: Center(
                  //                         child: CircularProgressIndicator()),
                  //                   ),
                  //                   errorWidget: (context, url, error) =>
                  //                       const Icon(Icons.error),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding:
                  //                     const EdgeInsets.symmetric(vertical: 10.0),
                  //                 child: Text(
                  //                   'Up to ${product.savings}% Off',
                  //                   style: TextStyle(
                  //                     color: fgColor,
                  //                     fontSize: 20.0,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Text(
                  //                 product.text ?? "",
                  //                 style: const TextStyle(
                  //                     color: Colors.grey, fontSize: 10),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 10),
                  //           child: Expanded(
                  //             flex: 1,
                  //             child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.end,
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: <Widget>[
                  //                   Expanded(
                  //                     child: CachedNetworkImage(
                  //                       width: 112,
                  //                       height: 112,
                  //                       imageUrl: product.productUrl ?? "",
                  //                       imageBuilder: (context, imageProvider) =>
                  //                           Container(
                  //                         decoration: BoxDecoration(
                  //                           image: DecorationImage(
                  //                               image: imageProvider,
                  //                               fit: BoxFit.fill),
                  //                         ),
                  //                       ),
                  //                       placeholder: (context, url) =>
                  //                           const SizedBox(
                  //                         width: 20,
                  //                         height: 20,
                  //                         child: Center(
                  //                             child: CircularProgressIndicator()),
                  //                       ),
                  //                       errorWidget: (context, url, error) =>
                  //                           const Icon(Icons.error),
                  //                     ),
                  //                   ),
                  //                 ]),
                  //           ),
                  //         )
                  //],
                )),
          ),
        ));
  }
}
