import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/TopWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/top_widget_view_more_page/brands_listing_page.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/top_widget_view_more_page/distributors_listing_page.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/top_widget_view_more_page/view_all_product_listing.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar.dart';

/// This class [TopWidgetsViewMoreListPage] which is UI screen which display interact with the user
class TopWidgetsViewMoreListPage extends StatefulWidget {
  const TopWidgetsViewMoreListPage({super.key});

  @override
  TopWidgetsViewMoreListPageState createState() =>
      TopWidgetsViewMoreListPageState();
}

class TopWidgetsViewMoreListPageState
    extends State<TopWidgetsViewMoreListPage> {
  late TopWidgetModel topWidgetModel;
  @override
  void initState() {
    topWidgetModel = getIt<TopWidgetModel>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: buildViewMoreWidget(topWidgetModel),
        backgroundColor: AppColors.screenContainerBackgroundColor,
      ),
    );
  }

  PreferredSizeWidget? buildAppbar() {
    return CustomAppBar(
      type: AppBarType.secondaryAppBar,
      isInterActive: true,
      callbackForHamburger: (action) {},
      onPressNotifications: () {
        // Navigator.pushNamed(context, RoutePaths.notifications);
      },
    );
  }
}

Widget buildViewMoreWidget(TopWidgetModel topWidgetModel) {
  if (topWidgetModel.type == "brands") {
    return BrandsListingPage(
      topWidgetModel: topWidgetModel,
    );
  }
  if (topWidgetModel.type == "products") {
    return ProductListingPage(
      topWidgetModel: topWidgetModel,
    );
  } else if (topWidgetModel.type == "distributors") {
    return DistributorsListingPage(
      topWidgetModel: topWidgetModel,
    );
  } else {
    return Container();
  }
}

Widget tittleWidget(TopWidgetModel topWidgetModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.0),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          topWidgetModel.title != ""
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        topWidgetModel.title!,
                        style: TextStyle(
                            color: Color(hexStringToHexInt(
                                topWidgetModel.titleColor ?? "#000000")),
                            fontWeight: FontWeight.w500,
                            fontSize: double.parse(
                                topWidgetModel.titleSize ?? "14.0")),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    ]),
  );
}
