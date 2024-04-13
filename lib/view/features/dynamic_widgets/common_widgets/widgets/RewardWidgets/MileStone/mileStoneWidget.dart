import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/utils/extensions.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/cubit/fly_milestone/milestone_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/flymilestone/mile_stone_entity.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/di/fly_milestone_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/RewordsWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/RewardWidgets/RewardWidget.dart';

class MileStoneWidget extends StatefulWidget {
  final RewordsWidgetModel rewordsWidgetModel;
  const MileStoneWidget({super.key, required this.rewordsWidgetModel});

  @override
  State<MileStoneWidget> createState() => _MileStoneWidgetState();
}

class _MileStoneWidgetState extends State<MileStoneWidget> {
  @override
  void initState() {
    super.initState();
    clearFlyMileStoneDi();
    initFlyMileStoneDi();
    mileStoneCubit.fetchMileStone();
  }

  bool isTCVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: BlocBuilder(
        bloc: mileStoneCubit,
        buildWhen: (previous, current) {
          return (current is MileStoneInitialState) ||
              (current is MileStoneLoadingState) ||
              (current is MileStoneErrorState) ||
              (current is MileStoneDataState);
        },
        builder: (context, state) {
          if (state is MileStoneLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MileStoneErrorState) {
            return Center(
              child: Container(
                child:
                    AppAssets.svg.icInfoCircleError.svg(width: 30, height: 30),
              ),
            );
          } else if (state is MileStoneDataState) {
            return state.mileStoneModel.isNotEmpty
                ? Column(
                    children: [
                      headerTittle(context, widget.rewordsWidgetModel),
                      milestoneWidget(state.mileStoneModel)
                    ],
                  )
                : Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget milestoneWidget(List<MileStoneOffers?> _list) {
    return Column(
        children: _list
            .map((cashback) => cashback!.milestones!.isEmpty
                ? Container()
                : Card(
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
                                                '\u{20B9}${cashback.milestones![0].title}',
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
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
                                                                FontWeight.w500,
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white),
                                                        '${calculateDaysBetween(cashback.endsOn!)}d left')),
                                              ),
                                            ]),
                                        Text(
                                          cashback.milestones![0].subTitle ??
                                              "",
                                          style: const TextStyle(
                                            fontSize: 11.0,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isTCVisible) {
                                                isTCVisible = false;
                                              } else {
                                                isTCVisible = true;
                                              }
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
                                                      color:
                                                          AppColors.lightGrey)),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                  (isTCVisible)
                                                      ? Icons.keyboard_arrow_up
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                          width: 40,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                              color:
                                                  AppColors.cardRectangleColor,
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
                            visible: isTCVisible,
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
                                      children: [
                                        Text(
                                          formatHtmlString(cashback.rules!),
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
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
                                                            (double.parse(cashback
                                                                        .totalUserScore!
                                                                        .toString() ??
                                                                    '0') /
                                                                100) -
                                                        10 <
                                                    0.0
                                                ? 0
                                                : 324 *
                                                        double.parse(cashback
                                                                .totalUserScore!
                                                                .toString() ??
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
                                                  '${(double.parse(cashback.totalUserScore!.toString() ?? '0') / 100 * 3).toStringAsFixed(1)}/3',
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
                                    value: double.parse(cashback.totalUserScore!
                                                .toString() ??
                                            '0') /
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

  @override
  void dispose() {
    super.dispose();
    clearFlyMileStoneDi();
  }
}

int calculateDaysBetween(DateTime from) {
  from = DateTime(from.year, from.month, from.day);
  DateTime to = DateTime.now();
  final leftDays =
      (to.difference(from).inHours / 24).round().toString().replaceAll('-', '');
  return int.parse(leftDays);
}
