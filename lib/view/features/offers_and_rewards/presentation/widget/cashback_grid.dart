import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'dart:math' as math;

import 'package:pharmarack/view/features/offers_and_rewards/model/cashback_model.dart';

class CashBackGrid extends StatefulWidget {
  const CashBackGrid({super.key});

  @override
  State<CashBackGrid> createState() => _CashbackState();
}

class _CashbackState extends State<CashBackGrid> {
  List<Cashbacks> _list = [];
  @override
  void initState() {
    super.initState();
    loadCashbacks();
  }

  void loadCashbacks() async {
    final res = await rootBundle.loadString("assets/mockData/cashbacks.json");
    final productData =
        CashbackModel.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      _list = productData.cashbacks!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _list.isEmpty
        ? Center(child: Container())
        : GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: (164 / 202),
            shrinkWrap: true,
            children: _list.map((cashback) => Cashback(cashback)).toList());
  }
}

class Cashback extends StatelessWidget {
  final Cashbacks cashback;

  const Cashback(this.cashback, {super.key});

  @override
  Widget build(BuildContext context) {
    bool rightArrowFlag = int.parse('${cashback.id}') % 2 == 0 ? false : true;
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 0.0),
        child: Expanded(
          flex: 1,
          child: Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: AppColors.onboardingCardBorderColor, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      color: AppColors.topsavingsbg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      )),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Center(
                          child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 130.0,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                    child: SizedBox(
                                  width: 79,
                                  height: 79,
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: CircularProgressIndicator(
                                      strokeCap: StrokeCap.round,
                                      backgroundColor: Colors.white,
                                      color: AppColors.primaryColor,
                                      strokeWidth: 6,
                                      value: double.parse(
                                              cashback.completed ?? '0') /
                                          100,
                                    ),
                                  ),
                                )),
                                Center(
                                    child: Text(
                                  '${cashback.completed}%',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor),
                                )),
                              ],
                            ),
                          ),
                        ],
                      )),
                      //Image.asset("assets/completed.png"),
                      Positioned.fill(
                        left: 0,
                        right: 10,
                        top: 10,
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3))),
                                padding: const EdgeInsets.fromLTRB(3, 4, 3, 4),
                                child: Text(
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Colors.white),
                                    '${cashback.leftDays}d left'))),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${cashback.deal}',
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(Icons.info_outline,
                                        color: AppColors.primaryColor,
                                        size: 12),
                                    // child: Image.asset(
                                    //   "assets/info.png",
                                    //   width: 15,
                                    //   height: 15,
                                    // ),
                                  )
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              cashback.text ?? "",
                              style: const TextStyle(
                                  fontSize: 11.0, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: rightArrowFlag,
                      child: Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                          child: Container(
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
                                    Icons.arrow_forward,
                                    color: AppColors.primaryColor,
                                  ))),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
