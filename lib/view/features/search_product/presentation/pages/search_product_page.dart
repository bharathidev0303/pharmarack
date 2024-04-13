import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/device_detector_widget.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/no_records_found.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/distributor_page/distributor_page_mobile_view.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/null_search_page/null_search_page_mobile_view.dart';
import 'package:pharmarack/view/features/filters/presentation/pages/filters_page_mobile_view.dart';
import 'package:pharmarack/view/features/search_product/data/api_service/search_product_api_service.dart';
import 'package:pharmarack/view/features/search_product/data/data_source/remote_data_source/search_product_remote_data_source.dart';
import 'package:pharmarack/view/features/search_product/di/search_product_providers.dart';
import 'package:pharmarack/view/features/search_product/domain/repository/search_product_repository.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/filter_search_product_use_case.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/search_product_use_case.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_state.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/search_product_page_web_view.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/widgets/search_product_mapped_unmapped.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar_cubit.dart';

class SearchProductPage extends BasePage<SearchProductPageState> {
  const SearchProductPage({super.key});

  @override
  SearchProductPageState createState() => SearchProductPageState();
}

class SearchProductPageState extends BaseStatefulPage {
  late SearchProductCubit searchProductCubit;
  int textLength = 0;

  @override
  void initState() {
    deInitStockiestDI();
    initStockiestDI();
    intProductDI();
    if (getIt.isRegistered<SearchProductCubit>()) {
      searchProductCubit = getIt<SearchProductCubit>();
    } else {
      deInitProductDI();
      intProductDI();
      searchProductCubit = getIt<SearchProductCubit>();
    }
    super.initState();

    searchProductCubit.fetchStockiestPriority('search');
  }

  @override
  Color scaffoldBackgroundColor() {
    return context.colors.screenBackground!;
  }

  @override
  Widget buildView(BuildContext context) {
    final focusFiled = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        appBar: CustomAppBar(
          isInterActive: true,
          searchBarFocusValue: focusFiled,
          onDropDownOpenCallBackForDistributor: (val) {
            searchProductCubit.handleBlurState(isBlur: val);
          },
          productAndDistributorCallBack: (product, id, storeName, companyId) {
            //to search with product only
            if (id == 0) {
              if (textLength <= product.length) {
                searchProductCubit.handleSearchText(
                    query: product, storeName: storeName);
              } else {
                if (product.isEmpty) {
                  searchProductCubit.handleSearchText(
                      query: product, storeName: storeName);
                }
              }
              textLength = product.length;
            }
            //to search with product and distributor
            else if (id != 0 && product.isNotEmpty) {
              searchProductCubit.handleSearchText(
                  query: product,
                  id: id,
                  storeName: storeName,
                  companyId: companyId);
            }
            // to show distributor's page
            else if (storeName != '' && id != 0 && product.isEmpty) {
              searchProductCubit.showDistributorsPage(storeName, id!);
            } else {
              searchProductCubit.invalidStore();
            }
          },
          onFilterClick: () {
            getIt<CustomAppBarCubit>().closeDistributorDropdown();
            showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                backgroundColor: AppColors.onboardingPageBackgroundColor,
                context: context,
                builder: (context) => FiltersPageMobileView(
                      callBack: () {},
                    ));
          },
        ),
        body: BlocConsumer<SearchProductCubit, SearchProductState>(
          bloc: searchProductCubit,
          buildWhen: (previous, current) {
            return (current is SearchProductDataState) ||
                (current is SearchProductErrorState) ||
                (current is SearchProductDataEmptyListState) ||
                (current is SearchProductErrorMessageState) ||
                (current is SearchProductInitialState) ||
                (current is SearchProductLoadingState) ||
                (current is SearchProductFilteredDataState) ||
                (current is ShowDistributorsLockedPageState) ||
                (current is ShowDistributorPageState);
          },
          listener: (ctx, state) {
            if (state is ShowDistributorsLockedPageState) {
              if (state.isPartyLockedByDist == 1) {
                showBinaryButtonAlertDialog(context,
                    subTitle: "context.localizedString",
                    firstButtonTitle: context.localizedString.ok);
              } else if (state.isPartyLocked == 1) {
                showBinaryButtonAlertDialog(context,
                    subTitle: context.localizedString.partySoonMsg,
                    firstButtonTitle: context.localizedString.ok);
              }
            }
          },
          builder: (context, state) {
            if (state is SearchProductFilteredDataState) {
              return DeviceDetectorWidget(
                  webSiteView: () => SearchProductPageWebView(
                      productList: state.mappedList ?? []),
                  phoneView: () => SearchProductMappedUnMappedPage(
                        mappedList: state.mappedList ?? [],
                        unMappedList: state.unMappedList ?? [],
                        searchProductCubit: searchProductCubit,
                      ));
            } else if (state is SearchProductErrorState) {
              return Container(
                  color: AppColors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: NoRecordsFound(
                        icons: AppAssets.svg.noDataFound.svg(),
                        message: context.localizedString.noDataFound,
                      )));
            } else if (state is SearchProductDataEmptyListState) {
              return Container(
                  color: AppColors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: NoRecordsFound(
                        icons: AppAssets.svg.noDataFound.svg(),
                        message: context.localizedString.noDataFound,
                      )));
            } else if (state is SearchProductErrorMessageState) {
              // return showPopUp(state.errorMessage, context);\
              return Container(
                  color: AppColors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: NoRecordsFound(
                        icons: AppAssets.svg.noDataFound.svg(),
                        message: context.localizedString.noDataFound,
                      )));
            } else if (state is SearchProductInitialState) {
              textLength = 0;
              return const NullSearchPageMobileView();
            } else if (state is ShowDistributorPageState) {
              return DistributorScreenPageMobileView(distributorId: state.id);
            } else {
              // loading state
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  showPopUp(String message, BuildContext context) {
    return AlertDialog(
      title: Text(context.localizedString.alert),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(context.localizedString.ok),
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (getIt.isRegistered<SearchProductApiService>()) {
      getIt.unregister<SearchProductApiService>();
    }

    if (getIt.isRegistered<SearchProductRemoteDataSource>()) {
      getIt.unregister<SearchProductRemoteDataSource>();
    }

    if (getIt.isRegistered<SearchProductRepository>()) {
      getIt.unregister<SearchProductRepository>();
    }

    if (getIt.isRegistered<SearchProductUseCase>()) {
      getIt.unregister<SearchProductUseCase>();
    }

    if (getIt.isRegistered<FilterSearchProductUseCase>()) {
      getIt.unregister<FilterSearchProductUseCase>();
    }

    if (getIt.isRegistered<SearchProductCubit>()) {
      getIt.unregister<SearchProductCubit>();
    }

    deInitStockiestDI();
    super.dispose();
  }
}
