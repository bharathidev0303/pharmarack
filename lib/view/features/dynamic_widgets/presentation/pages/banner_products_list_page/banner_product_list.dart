import 'package:flutter/material.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/banner_products_list_page/banner_products_mobile_view_page.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar.dart';

/// This class [BannerProductsListPage] which is UI screen which display interact with the user
class BannerProductsListPage extends StatefulWidget {
  final String tittle;
  final String productIds;

  const BannerProductsListPage(
      {super.key, required this.tittle, required this.productIds});

  @override
  BannerProductsListPageState createState() => BannerProductsListPageState();
}

class BannerProductsListPageState extends State<BannerProductsListPage> {
  @override
  void initState() {
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
        body: BannerProductsMobileViewPage(
          tittle: widget.tittle,
          productIds: widget.productIds,
        ),
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
