import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/TopWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/top_widget_view_more_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/top_widgets_view_more/top_widgets_view_more_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopBrandsList.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/top_widget_view_more_page/top_widgets_view_more_page.dart';

class BrandsListingPage extends StatefulWidget {
  final TopWidgetModel topWidgetModel;
  const BrandsListingPage({
    super.key,
    required this.topWidgetModel,
  });

  @override
  State<BrandsListingPage> createState() => _BrandsListingPageState();
}

class _BrandsListingPageState extends State<BrandsListingPage> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  int _page = 1;
  final int _limit = 50;
  List<TopBrandsLists> brandsList = List<TopBrandsLists>.empty(growable: true);
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    clearTopWidgetsViewMorsDi();
    initTopWidgetsViewMoreDi();
    topWidgetsViewMoreCubit.fetchBrands(page: _page, limit: _limit);

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        topWidgetsViewMoreCubit.fetchBrands(page: ++_page, limit: _limit);
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
                (current is TopWidgetsBrandsDataState);
          },
          builder: (context, state) {
            if (state is TopWidgetsViewMoreLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopWidgetsViewMoreErrorState) {
              return Center(
                child: Container(
                  child: AppAssets.svg.icInfoCircleError
                      .svg(width: 30, height: 30),
                ),
              );
            } else if (state is TopWidgetsBrandsDataState) {
              return SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(children: [
                  tittleWidget(widget.topWidgetModel),
                  buildBrandsList(state.brands),
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
          pageBuilder: (a, b, c) => TopWidgetsViewMoreListPage(
                topWidgetModel: widget.topWidgetModel,
              )),
    );
    return;
  }

  Widget buildBrandsList(List<TopBrandsLists> brands) {
    brandsList.addAll(brands);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        brands.isNotEmpty
            ? Wrap(
                children: brandsList.map((item) {
                  int index = brandsList.indexOf(item) + 1;
                  if (index < brandsList.length) {
                    return IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          item.name != ""
                              ? InkWell(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: const BorderSide(
                                          color: Color(0XFFE2E4E9), width: 0.5),
                                    ),
                                    margin: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.4,
                                        height: 30,
                                        child: Center(
                                            child: Text(
                                          item.name!,
                                          overflow: TextOverflow.ellipsis,
                                        ))),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  } else if (_limit <= brandsList.length) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: CircularProgressIndicator(),
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
