import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/no_records_found.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/cart/di/cart_provider.dart';
import 'package:pharmarack/view/dashboard/order_history/di/order_history_provider.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_param.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_list_state.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/display_order_list_item.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/widgets/order_history_filter.dart';
import 'package:pharmarack/view/features/landing_page/landing_page.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar_cubit.dart';

class OrderHistoryPage extends StatefulWidget {
  final VoidCallback? onPressBackButton;
  const OrderHistoryPage({super.key, this.onPressBackButton});

  @override
  OrderHistoryPageState createState() => OrderHistoryPageState();
}

class OrderHistoryPageState extends State<OrderHistoryPage> {
  late OrderHistoryCubit _orderHistoryCubit;
  late SearchProductCubit searchProductCubit;
  late CustomAppBarCubit customcubit;
  @override
  void initState() {
    initStockiestDI();
    initOrderHistoryPageDI();
    intProductDI();
    _orderHistoryCubit = getIt<OrderHistoryCubit>();
    searchProductCubit = getIt<SearchProductCubit>();
    customcubit = getIt<CustomAppBarCubit>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _orderHistoryCubit
          .getDisplayOrders(); //filterParams: OrderHistoryFilterParams(fromDate: '08/02/24',toDate: '08/02/24',status: 'All')
    });

    draggableCartScreenCubit.getCartDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: SecondaryAppBar(
          titleText: context.localizedString.myOrders,
          onPressBackButton: () {
            customcubit.closeDistributorDropdown();
            if (widget.onPressBackButton != null) {
              widget.onPressBackButton?.call();
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LandingPage()));
            }
          },
          actions: [
            InkWell(
              onTap: () async {
                await customcubit.closeDistributorDropdown();
                await showModalBottomSheet<OrderHistoryFilterParams>(
                  useRootNavigator: false,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 0.67,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.dialogBackground,
                        child: const OrderHistoryFilter(),
                      ),
                    );
                  },
                ).then((value) async {
                  _orderHistoryCubit.getDisplayOrders(
                      filterParams: OrderHistoryFilterParams(
                          fromDate: value!.fromDate,
                          toDate: value.toDate,
                          status: value.status,
                          searchTxt: value.searchTxt,
                          storeId: value.storeId));
                });
              },
              child: AppAssets.svg.icFilterSettings.svg(),
            ),
          ]),
      body: Column(
        children: [
          CustomAppBar(
            type: AppBarType.searchView,
            page: 'order_history',
            isInterActive: true,
            onDropDownOpenCallBackForDistributor: (val) {
              searchProductCubit.handleBlurState(isBlur: val);
            },
            productAndDistributorCallBack: (product, id, storeName, companyId,
                selectedCompanyName, contextType) {
              //to search with product only
              if (id == 0 && product != '' && product.length >= 3) {
                orderHistoryFilterCubit.searchTxt = product;
                orderHistoryFilterCubit.storeId = id ?? -1;
                _orderHistoryCubit.getDisplayOrders(
                    filterParams: OrderHistoryFilterParams(
                        fromDate: orderHistoryFilterCubit.from,
                        toDate: orderHistoryFilterCubit.to,
                        status: orderHistoryFilterCubit.status,
                        searchTxt: orderHistoryFilterCubit.searchTxt,
                        storeId: orderHistoryFilterCubit.storeId));
              }
              //to search with product and distributor
              if (id != 0 && product != '' && product.length >= 3) {
                orderHistoryFilterCubit.searchTxt = product;
                orderHistoryFilterCubit.storeId = id ?? -1;
                _orderHistoryCubit.getDisplayOrders(
                    filterParams: OrderHistoryFilterParams(
                        fromDate: orderHistoryFilterCubit.from,
                        toDate: orderHistoryFilterCubit.to,
                        status: orderHistoryFilterCubit.status,
                        searchTxt: orderHistoryFilterCubit.searchTxt,
                        storeId: orderHistoryFilterCubit.storeId));
              }
              // to show distributor's page
              if (product == '' &&
                  (storeName == '' || storeName == 'All') &&
                  id == 0) {
                orderHistoryFilterCubit.searchTxt = product;
                orderHistoryFilterCubit.storeId = id ?? -1;
                _orderHistoryCubit.getDisplayOrders(
                    filterParams: OrderHistoryFilterParams(
                        fromDate: orderHistoryFilterCubit.from,
                        toDate: orderHistoryFilterCubit.to,
                        status: orderHistoryFilterCubit.status,
                        searchTxt: orderHistoryFilterCubit.searchTxt,
                        storeId: orderHistoryFilterCubit.storeId));

                searchProductCubit.showDistributorsPage(storeName, id!);
              }
              if (product == '' && storeName != '' && id != 0) {
                orderHistoryFilterCubit.searchTxt = product;
                orderHistoryFilterCubit.storeId = id ?? -1;
                _orderHistoryCubit.getDisplayOrders(
                    filterParams: OrderHistoryFilterParams(
                        fromDate: orderHistoryFilterCubit.from,
                        toDate: orderHistoryFilterCubit.to,
                        status: orderHistoryFilterCubit.status,
                        searchTxt: orderHistoryFilterCubit.searchTxt,
                        storeId: orderHistoryFilterCubit.storeId));

                searchProductCubit.showDistributorsPage(storeName, id!);
              }
            },
          ),
          BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
            bloc: _orderHistoryCubit,
            listener: (BuildContext context, state) {
              if (state is OrderHistoryLoadingState) {
                showProcessingRequestDialog(context, userRootNavigator: false);
              } else if (state is OrderHistoryErrorState) {
                CommonDialogs.closeCommonDialog(context: context);
                CommonDialogs.showSimpleDialog(
                    parentContext: context,
                    title: context.localizedString.attention,
                    subTitle: context.localizedString.somethingWentWrong,
                    buttonTitle: context.localizedString.ok,
                    barrierDismissible: true);
              } else if (state is OrderHistorySuccessState) {
                CommonDialogs.closeCommonDialog(context: context);
              } else if (state is OrderHistoryResetState) {
                _orderHistoryCubit.getDisplayOrders(
                    filterParams: OrderHistoryFilterParams(
                        fromDate: orderHistoryFilterCubit.from,
                        toDate: orderHistoryFilterCubit.to,
                        status: orderHistoryFilterCubit.status,
                        searchTxt: '',
                        storeId: orderHistoryFilterCubit.storeId));
              }
            },
            builder: (BuildContext context, state) {
              if (state is OrderHistoryLoadingState) {
                showProcessingRequestDialog(context, userRootNavigator: false);
              } else if (state is OrderHistorySuccessState) {
                List<DisplayOrder> orders = state.orders;
                return Expanded(
                    child: RefreshIndicator(
                  onRefresh: () async {
                    _orderHistoryCubit.getDisplayOrders();
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          final item = orders[index];
                          return DisplayOrderListItem(item);
                        },
                      )),
                ));
              } else if (state is OrderHistoryNoDataState) {
                CommonDialogs.closeCommonDialog(context: context);
                return Expanded(
                  child: Container(
                      color: AppColors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: NoRecordsFound(
                            icons: AppAssets.svg.noRecordFound.svg(),
                            message: context.localizedString.noProductStr,
                          ))),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    clearOrderHistoryDI();
    deInitProductDI();
    deInitStockiestDI();
    super.dispose();
  }
}
