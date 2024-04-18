import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/offers_and_rewards/model/offers_model.dart';

class CustomCardOffers extends StatefulWidget {
  const CustomCardOffers({super.key});

  @override
  State<CustomCardOffers> createState() => OffersState();
}

class OffersState extends State<CustomCardOffers> {
  List<Offers> _availableProducts = [];
  @override
  void initState() {
    super.initState();
    loadOffers();
  }

  void loadOffers() async {
    final res = await rootBundle.loadString("assets/mockData/offers.json");
    final productData =
        OffersModel.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      _availableProducts = productData.offers!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _availableProducts.isEmpty
        ? Center(child: Container())
        : Column(
            children: _availableProducts
                .map((product) => OfferItem(product))
                .toList());
  }
}

class OfferItem extends StatelessWidget {
  final Offers product;
  const OfferItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Image.network(
                '${product.productUrl}',
                alignment: Alignment.topLeft,
                height: 82,
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        2.0, 2.0, 0.0, 2.0),
                                    child: Text(
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        '${product.productName}'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        2.0, 2.0, 0.0, 2.0),
                                    child: Row(
                                      children: [
                                        Text(
                                            style: const TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                            '${product.companyName}'),
                                        AppAssets.svg.blueArrowUpRight.svg(
                                            package: 'core_flutter',
                                            height: 12,
                                            width: 12),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        2.0, 2.0, 8.0, 2.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                            style: TextStyle(
                                              color:
                                                  AppColors.secondaryTextColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            'PTR:'),
                                        Text(
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            '${product.pTR}')
                                      ],
                                    ),
                                  ),
                                  const Text(
                                      style: TextStyle(
                                        color: AppColors.secondaryTextColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      'MRP:'),
                                  Text(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      '${product.mRP}')
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.cardRectangleColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: IconButton(
                              iconSize: 16,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: AppColors.primaryColor,
                              ))),
                    ],
                  ),
                ))
          ],
        ));
  }
}
