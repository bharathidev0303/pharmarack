import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/utils/extensions.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/TopWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/top_widget_view_more_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/top_widgets_view_more/top_widgets_view_more_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopBrandsList.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopDistributorsList.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/distributor_page/distributor_page_mobile_view.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/top_widget_view_more_page/top_widgets_view_more_page.dart';

class DistributorsListingPage extends StatefulWidget {
  final TopWidgetModel topWidgetModel;
  const DistributorsListingPage({super.key, required this.topWidgetModel});

  @override
  State<DistributorsListingPage> createState() =>
      _DistributorsListingPageState();
}

class _DistributorsListingPageState extends State<DistributorsListingPage> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  int _page = 1;
  final int _limit = 50;
  List<TopBrandsLists> brandsList = List<TopBrandsLists>.empty(growable: true);
  List<TopDistributorsList> distributorsList =
      List<TopDistributorsList>.empty(growable: true);
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    clearTopWidgetsViewMorsDi();
    initTopWidgetsViewMoreDi();
    topWidgetsViewMoreCubit.fetchDistributors(page: _page, limit: _limit);

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        topWidgetsViewMoreCubit.fetchDistributors(page: ++_page, limit: _limit);
      }
    });
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
          bloc: topWidgetsViewMoreCubit,
          buildWhen: (previous, current) {
            return (current is TopWidgetsViewMoreInitialState) ||
                (current is TopWidgetsViewMoreLoadingState) ||
                (current is TopWidgetsViewMoreErrorState) ||
                (current is TopWidgetsDistributorsDataState);
          },
          builder: (context, state) {
            if (state is TopWidgetsViewMoreLoadingState) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: AppColors.blueButtonColor,
                  size: 50.0,
                ),
              );
            } else if (state is TopWidgetsViewMoreErrorState) {
              return Center(
                child: Container(
                  child: AppAssets.svg.icInfoCircleError
                      .svg(width: 30, height: 30),
                ),
              );
            } else if (state is TopWidgetsDistributorsDataState) {
              return SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(children: [
                  tittleWidget(widget.topWidgetModel),
                  buildDistributorsList(state.distributors),
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

  Future<void> _refreshPage(context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (a, b, c) => const TopWidgetsViewMoreListPage()),
    );
    return;
  }

  Widget buildDistributorsList(List<TopDistributorsList> distributors) {
    distributorsList.addAll(distributors);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        distributorsList.isNotEmpty
            ? Wrap(
                children: distributorsList.map((item) {
                  int index = distributorsList.indexOf(item) + 1;
                  if (index < distributorsList.length) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DistributorScreenPageMobileView(
                                    distributorId: item.storeId,
                                    appBar: true,
                                  )),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 7.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              item.distributorName != null
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.distributorName!
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
                              item.address1?.isNotEmpty != null ||
                                      item.city?.isNotEmpty != null ||
                                      item.state?.isNotEmpty != null
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: AppColors.black38,
                                          size: 14,
                                        ),
                                        item.address1?.isNotEmpty != null
                                            ? Text(
                                                item.address1 ?? "",
                                                style: const TextStyle(
                                                    color: AppColors.black38),
                                              )
                                            : Container(),
                                        item.address1?.isNotEmpty != null
                                            ? const Text(
                                                " ",
                                                style: TextStyle(
                                                    color: AppColors.black38),
                                              )
                                            : Container(),
                                        item.city?.isNotEmpty != null
                                            ? Text(
                                                item.city ?? "",
                                                style: const TextStyle(
                                                    color: AppColors.black38),
                                              )
                                            : Container(),
                                        item.city?.isNotEmpty != null
                                            ? const Text(
                                                ", ",
                                                style: TextStyle(
                                                    color: AppColors.black38),
                                              )
                                            : Container(),
                                        item.state?.isNotEmpty != null
                                            ? Text(
                                                item.state ?? "",
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
                  } else if (_limit <= distributorsList.length) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: SpinKitFadingCircle(
                          color: AppColors.blueButtonColor,
                          size: 50.0,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }).toList(),
              )
            : Container(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    clearTopWidgetsViewMorsDi();
  }
}
