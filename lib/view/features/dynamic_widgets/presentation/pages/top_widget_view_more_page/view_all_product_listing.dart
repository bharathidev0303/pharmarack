import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/product_list_item/product_list_item.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/no_records_found.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/pageConfigModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/ProductListModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/TopWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/TopWidgets/ProductsWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/top_widget_view_more_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/top_widgets_view_more/top_widgets_view_more_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/top_widget_view_more_page/top_widgets_view_more_page.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/widgets/add_product_to_cart_popup.dart';

class ProductListingPage extends StatefulWidget {
  final TopWidgetModel topWidgetModel;
  const ProductListingPage({super.key, required this.topWidgetModel});

  @override
  State<ProductListingPage> createState() => _DistributorsListingPageState();
}

class _DistributorsListingPageState extends State<ProductListingPage> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late PageConfigModel pageConfigModel;
  @override
  void initState() {
    super.initState();
    clearTopWidgetsViewMorsDi();
    initTopWidgetsViewMoreDi();
    if (getIt.isRegistered<PageConfigModel>()) {
      pageConfigModel = getIt<PageConfigModel>();
    } else {
      pageConfigModel = PageConfigModel();
    }
    topWidgetsViewMoreCubit.fetchTopWidgetsProducts(
        companyId: pageConfigModel.companyId ?? 0,
        stoteId: pageConfigModel.storeId ?? 0,
        context: widget.topWidgetModel.context!);
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
                (current is TopWidgetsProductsDataState);
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
            } else if (state is TopWidgetsProductsDataState) {
              if (state.products.isNotEmpty) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(children: [
                    tittleWidget(widget.topWidgetModel),
                    pageConfigModel.page == "company_page"
                        ? companyProductListWidget(context, state.products)
                        : productListWidget(context, state.products),
                  ]),
                );
              } else {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: NoRecordsFound(
                          icons: AppAssets.svg.noDataFound.svg(),
                          message: context.localizedString.noDataFound,
                        )));
              }
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

  @override
  void dispose() {
    super.dispose();
    clearTopWidgetsViewMorsDi();
  }
}
