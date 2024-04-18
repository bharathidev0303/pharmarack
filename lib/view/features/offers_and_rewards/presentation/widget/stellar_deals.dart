import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/offers_and_rewards/model/stellar_deals_model.dart';

class StellarDealsList extends StatefulWidget {
  const StellarDealsList({super.key});

  @override
  State<StellarDealsList> createState() => StellarDealsState();
}

class StellarDealsState extends State<StellarDealsList> {
  List<StellarDeals> _list = [];
  //bool isTCVisible = false;
  var tCList = [
    "Retailers will be eligible for Rs. 101 cashback on ordering an amount above Rs. 20000.​",
    "Campaign will be valid only on 18th Aug ‘23​.",
    "This cashback is applicable only for retailers with valid UPI ID added in the cashback section on Pharmarack app.​",
    "Retailers will be eligible for cashback only once.​",
    "The campaign falls under the purview of fair transaction policy & cashback shall be awarded to retailers placing genuine transactions with authentic UPI IDs mapped only​.",
    "Order can be placed via multiple distributors, total of which is to be more than Rs. 20000​.",
    "Order has to be placed on 18th August and can be processed upto 21th August. All users whose orders are processed upto 21th August would be considered for the cashback."
  ];

  @override
  void initState() {
    super.initState();
    loadStellarDeals();
  }

  void loadStellarDeals() async {
    final res =
        await rootBundle.loadString('assets/mockData/stellardeals.json');
    final productData =
        StellarDealsModel.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      _list = productData.stellarDeals!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _list.isEmpty
        ? Center(child: Container())
        : Column(
            children: _list
                .map((cashback) => Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: AppColors.grey93, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '\u{20B9}${cashback.deal}',
                                                  style: const TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          color: Colors.orange,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      3))),
                                                      padding: const EdgeInsets
                                                          .fromLTRB(3, 4, 3, 4),
                                                      child: Text(
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white),
                                                          '${cashback.leftDays}d left')),
                                                ),
                                              ]),
                                          Text(
                                            cashback.text ?? "",
                                            style: const TextStyle(
                                              fontSize: 11.0,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                cashback.isTCVisible =
                                                    (!bool.parse(cashback
                                                                .isTCVisible ??
                                                            "false"))
                                                        .toString();
                                              });
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text(
                                                    'Terms & Conditions apply',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: AppColors
                                                            .lightGrey)),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                    (bool.parse(cashback
                                                                .isTCVisible ??
                                                            "true"))
                                                        ? Icons
                                                            .keyboard_arrow_up
                                                        : Icons
                                                            .keyboard_arrow_down,
                                                    color: AppColors
                                                        .dashboardSubTitleColor,
                                                    size: 19)
                                              ],
                                            ),
                                          )
                                        ]),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                            width: 40,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                                color: AppColors
                                                    .cardRectangleColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: IconButton(
                                                iconSize: 16,
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  color: AppColors.primaryColor,
                                                )))
                                      ],
                                    ),
                                  )
                                ]),
                            Visibility(
                              visible:
                                  bool.parse(cashback.isTCVisible ?? "false"),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: AppColors.grey93, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  elevation: 0.0,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: tCList
                                            .map((tc) => Text(
                                                  '\u2022 $tc',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ))
                                            .toList(),
                                      ))),
                            ),
                            Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              324 *
                                                              (double.parse(
                                                                      cashback.completed ??
                                                                          '0') /
                                                                  100) -
                                                          10 <
                                                      0.0
                                                  ? 0
                                                  : 324 *
                                                          double.parse(cashback
                                                                  .completed ??
                                                              '0') /
                                                          100 -
                                                      35,
                                              // double.parse(cashback.completed ??
                                              //             '0') *
                                              //         3 +
                                              //     double.parse(
                                              //             cashback.completed ??
                                              //                 '0') /
                                              //         30,
                                              7,
                                              0,
                                              0),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/TooltipTop.png",
                                                  fit: BoxFit.fill,
                                                  width: 33,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 5),
                                                  child: Text(
                                                    '${(double.parse(cashback.completed ?? '0') / 100 * 3).toStringAsFixed(1)}/3',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    LinearProgressIndicator(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      minHeight: 10,
                                      value: double.parse(
                                              cashback.completed ?? '0') /
                                          100,
                                      backgroundColor: Colors
                                          .grey[300], // Set background color
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              AppColors.primaryColor),
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '0',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          '2',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          '3',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                .toList());
  }
}

class StellarDeal extends StatelessWidget {
  final StellarDeals cashback;
  const StellarDeal(this.cashback, {super.key});

  @override
  Widget build(BuildContext context) {
    var tCList = [
      "Retailers will be eligible for Rs. 101 cashback on ordering an amount above Rs. 20000.​",
      "Campaign will be valid only on 18th Aug ‘23​.",
      "This cashback is applicable only for retailers with valid UPI ID added in the cashback section on Pharmarack app.​",
      "Retailers will be eligible for cashback only once.​",
      "The campaign falls under the purview of fair transaction policy & cashback shall be awarded to retailers placing genuine transactions with authentic UPI IDs mapped only​.",
      "Order can be placed via multiple distributors, total of which is to be more than Rs. 20000​.",
      "Order has to be placed on 18th August and can be processed upto 21th August. All users whose orders are processed upto 21th August would be considered for the cashback."
    ];
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            '${cashback.deal}',
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.white),
                                    '${cashback.leftDays}d left')),
                          ),
                        ]),
                        Text(
                          cashback.text ?? "",
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        const Text('Terms & Conditions apply',
                            style: TextStyle(color: AppColors.lightGrey))
                      ]),
                  const Column(
                    children: [],
                  )
                ]),
            Visibility(
              visible: bool.parse('false'),
              child: Card(
                  elevation: 0.0,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children:
                            tCList.map((tc) => Text('\u2022 $tc')).toList(),
                      ))),
            ),
            const Row(children: [
              // LinearProgressIndicator(
              //   value: double.parse(cashback.completed ?? '0'),
              //   backgroundColor: Colors.grey[300], // Set background color
              //   valueColor: const AlwaysStoppedAnimation<Color>(
              //       AppColors.circleArc), // Set progress color
              // ),
            ])
          ],
        ),
      ),
    );
  }
}
