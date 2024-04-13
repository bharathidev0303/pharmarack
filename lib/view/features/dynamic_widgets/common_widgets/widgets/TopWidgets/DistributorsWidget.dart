// Distributors Widget
import 'package:flutter/material.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/utils/extensions.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/DistributorsListModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/TopWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/TopWidgets/TopWidgets.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/distributor_page/distributor_page_mobile_view.dart';

Future<DistributorsItemList> _loadDistributorsWidgetData(
    List<dynamic> children) async {
  try {
    if (children.isNotEmpty) {
      return DistributorsItemList.fromJson(children);
    } else {
      return DistributorsItemList(distributors: []);
    }
  } catch (error) {
    rethrow;
  }
}

class DistributorsWidget extends StatefulWidget {
  final TopWidgetModel distributorsWidgetData;

  const DistributorsWidget({super.key, required this.distributorsWidgetData});

  @override
  State<DistributorsWidget> createState() => _DistributorsWidgetState();
}

class _DistributorsWidgetState extends State<DistributorsWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadDistributorsWidgetData(widget.distributorsWidgetData.data),
      builder: (context, AsyncSnapshot<DistributorsItemList> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          DistributorsItemList distributorsItems = snapshot.requireData;
          int? itemShown =
              int.parse(widget.distributorsWidgetData!.itemsToShow ?? "4");
          return distributorsItems.distributors.length > 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 7.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      topTitleWidget(widget.distributorsWidgetData, context),
                      distributorsListWidget(
                          context,
                          distributorsItems.distributors
                              .take(itemShown)
                              .toList(),
                          widget.distributorsWidgetData.showAddDistributorsBtn),
                      widget.distributorsWidgetData.showAddDistributorsBtn ==
                              true
                          ? const SizedBox(
                              height: 10.0,
                            )
                          : Container(),
                      widget.distributorsWidgetData.showAddDistributorsBtn ==
                              true
                          ? InkWell(
                              onTap: () => {
                                Navigator.pushNamed(
                                  context,
                                  RoutePaths.distributorConnection,
                                  arguments: 1,
                                )
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0XFFE4E9FA),
                                ),
                                padding: const EdgeInsets.all(10),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: const Center(
                                  child: Text(
                                    "Add Distributor",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0XFF1439BB),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                )
              : Container();
        } else {
          return const Center(
              // child: CircularProgressIndicator(),
              );
        }
      },
    );
  }
}

Widget distributorsListWidget(context,
    List<DistributorsListModel> distributorsItems, showAddDistributorsBtn) {
  return distributorsItems!.isNotEmpty
      ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: distributorsItems!.asMap().entries.map((entry) {
            int index = entry.key;
            DistributorsListModel distributorsItem = entry.value;
            if (distributorsItem.distributorAddress1 == null) {
              distributorsItem.distributorAddress1 = "Sadashiv ";
            }
            if (distributorsItem.distributorCity == null) {
              distributorsItem.distributorCity = "Peth";
            }
            if (distributorsItem.distributorState?.isNotEmpty == null) {
              distributorsItem.distributorState = "Pune";
            }
            if (showAddDistributorsBtn != true) {
              distributorsItem.distributorAddress1 = null;
              distributorsItem.distributorAddress2 = null;
              distributorsItem.distributorCity = null;
              distributorsItem.distributorState = null;
            }
            return InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DistributorScreenPageMobileView(
                            distributorId: distributorsItem.storeId,
                            appBar: true,
                          )),
                );
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      distributorsItem.distributorName != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  distributorsItem.distributorName!
                                      .toString()
                                      .toTitleCase(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: AppColors.blueLinkTextColor,
                                )
                              ],
                            )
                          : Container(),
                      distributorsItem.distributorAddress1?.isNotEmpty !=
                                  null ||
                              distributorsItem.distributorCity?.isNotEmpty !=
                                  null ||
                              distributorsItem.distributorState?.isNotEmpty !=
                                  null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.black38,
                                  size: 14,
                                ),
                                distributorsItem
                                            .distributorAddress1?.isNotEmpty !=
                                        null
                                    ? Text(
                                        distributorsItem.distributorAddress1 ??
                                            "",
                                        style: const TextStyle(
                                            color: AppColors.black38),
                                      )
                                    : Container(),
                                distributorsItem
                                            .distributorAddress1?.isNotEmpty !=
                                        null
                                    ? const Text(
                                        " ",
                                        style:
                                            TextStyle(color: AppColors.black38),
                                      )
                                    : Container(),
                                distributorsItem.distributorCity?.isNotEmpty !=
                                        null
                                    ? Text(
                                        distributorsItem.distributorCity ?? "",
                                        style: const TextStyle(
                                            color: AppColors.black38),
                                      )
                                    : Container(),
                                distributorsItem.distributorCity?.isNotEmpty !=
                                        null
                                    ? const Text(
                                        ", ",
                                        style:
                                            TextStyle(color: AppColors.black38),
                                      )
                                    : Container(),
                                distributorsItem.distributorState?.isNotEmpty !=
                                        null
                                    ? Text(
                                        distributorsItem.distributorState ?? "",
                                        style: const TextStyle(
                                            color: AppColors.black38),
                                      )
                                    : Container(),
                              ],
                            )
                          : Container(),
                    ]),
              ),
            );
          }).toList())
      : Container();
}
