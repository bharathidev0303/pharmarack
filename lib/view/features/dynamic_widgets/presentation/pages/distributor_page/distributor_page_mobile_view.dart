import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/view/dashboard/cart/di/cart_provider.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/distributors_page_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/page_config_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/distributors_page/distributors_page_state.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar.dart';

class DistributorScreenPageMobileView extends StatefulWidget {
  final int? distributorId;
  final bool? appBar;
  const DistributorScreenPageMobileView(
      {super.key, required this.distributorId, this.appBar = false});

  @override
  State<DistributorScreenPageMobileView> createState() =>
      _DistributorScreenPageMobileViewState();
}

class _DistributorScreenPageMobileViewState
    extends State<DistributorScreenPageMobileView> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late RetailerInfoEntity userInfo;
  late LoginResponseStores? distributorInfo;
  @override
  void initState() {
    clearDistributorsPageDi();
    initDistributorsPageDi();
    userInfo = getIt<RetailerInfoEntity>();

    draggableCartScreenCubit.getCartDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.distributorId != 0) {
      distributorInfo = userInfo.stores
          ?.where((e) => e.storeId == widget.distributorId)
          .first;
      initPageConfigDi(
          pageName: "distributor_page",
          storeId: distributorInfo!.storeId,
          storeName: distributorInfo!.storeName);
      distributorsPageScreenCubit.fetchDistributorPage(
          sId: distributorInfo!.storeId.toString());
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.screenBackground,
        appBar: widget.appBar == true ? buildAppbar() : null,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: BlocBuilder(
            bloc: distributorsPageScreenCubit,
            buildWhen: (previous, current) {
              return (current is DistributorsPageInitialState) ||
                  (current is DistributorsPageLoadingState) ||
                  (current is DistributorsPageErrorState) ||
                  (current is DistributorsPageDataState);
            },
            builder: (context, state) {
              if (state is DistributorsPageLoadingState) {
                return const Center(
                  child: SpinKitFadingCircle(
                    color: AppColors.blueButtonColor,
                    size: 50.0,
                  ),
                );
              } else if (state is DistributorsPageErrorState) {
                return Center(
                  child: Container(
                    child: AppAssets.svg.icInfoCircleError
                        .svg(width: 30, height: 30),
                  ),
                );
              } else if (state is DistributorsPageDataState) {
                if (state.distributorsPageModel.widget.first
                        .toString()
                        .substring(0, 7) !=
                    "Padding") {
                  state.distributorsPageModel.widget
                      .insert(0, distributorsTittle(context, distributorInfo));
                }
                return ListView(
                  children: state.distributorsPageModel.widget,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? buildAppbar() {
    return CustomAppBar(
      type: AppBarType.dashBoard,
      isInterActive: false,
      callbackForHamburger: (action) {},
      onPressNotifications: () {
        // Navigator.pushNamed(context, RoutePaths.notifications);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    clearDistributorsPageDi();
  }
}

Widget distributorsTittle(context, distributorInfo) {
  if (distributorInfo!.address1 == "null") {
    distributorInfo!.address1 = "Sadashiv Peth";
  }
  if (distributorInfo!.city == "null") {
    distributorInfo!.address1 = "Pune";
  }
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to ${distributorInfo?.storeName}",
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          distributorInfo!.address1 != "null" || distributorInfo!.city != "null"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(Icons.location_on_outlined,
                                color: AppColors.black38, size: 16),
                          ),
                          distributorInfo!.address1 != "null"
                              ? TextSpan(
                                  text: " ${distributorInfo?.address1}, ",
                                  style: const TextStyle(
                                      color: AppColors.black38, fontSize: 14),
                                )
                              : const TextSpan(),
                          distributorInfo!.city != "null"
                              ? TextSpan(
                                  text: "${distributorInfo?.city} ",
                                  style: const TextStyle(
                                      color: AppColors.black38, fontSize: 14),
                                )
                              : const TextSpan(),
                        ],
                      ),
                    ),
                    // RichText(
                    //   text: const TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: "Total Balance:",
                    //         style: TextStyle(
                    //             color: AppColors.black38, fontSize: 14),
                    //       ),
                    //       WidgetSpan(
                    //         child: Icon(Icons.currency_rupee_sharp,
                    //             color: AppColors.black38, size: 16),
                    //       ),
                    //       TextSpan(
                    //         text: "10,000",
                    //         style: TextStyle(
                    //             color: AppColors.black38, fontSize: 14),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                )
              : Container(),
        ],
      ));
}
