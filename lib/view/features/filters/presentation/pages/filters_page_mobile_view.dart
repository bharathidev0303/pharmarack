import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/snackbar_view/context_extensions.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/snackbar_view/custom_toast.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_rounder_corner_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/filters/domain/model/filters/filter_type.dart';
import 'package:pharmarack/view/features/filters/presentation/pages/widgets/search_by_product_filter.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_state.dart';

/// This class [FiltersPageMobileView] which specifically used to render Mobile UI
class FiltersPageMobileView extends StatefulWidget {
  final Function? callBack;

  const FiltersPageMobileView({super.key, required this.callBack});

  @override
  State<StatefulWidget> createState() => FiltersPageMobileViewState();
}

class FiltersPageMobileViewState extends State<FiltersPageMobileView> {
  @override
  void initState() {
    super.initState();
    getIt<SearchProductCubit>().addInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductCubit, SearchProductState>(
        bloc: getIt<SearchProductCubit>(),
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.onboardingPageBackgroundColor,
              body: Container(
                color: AppColors.appBarColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          key: const Key("companiesDropdownArrow"),
                          onTap: () {
                            widget.callBack!();
                          },
                          child: Center(
                            child: AppAssets.svg.downBroadArrow.svg(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Text(
                            context.localizedString.filter,
                            style: context.textStyles.header4Medium
                                ?.copyWith(color: context.colors.textSecondary),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildFiltersSelectionView(
                                  context.localizedString.searchBy, [
                                SearchByProductFilter(
                                    filterName: context
                                        .localizedString.stockAndPriority,
                                    value: 1,
                                    requestKey: FilterType.BothStockAndPriority,
                                    groupKey: FilterType.searchBy),
                                SearchByProductFilter(
                                    filterName:
                                        context.localizedString.priority,
                                    value: 2,
                                    requestKey: FilterType.OnlyPriority,
                                    groupKey: FilterType.searchBy)
                              ]),
                              _buildFiltersSelectionView(
                                  context.localizedString.stock.toUpperCase(), [
                                SearchByProductFilter(
                                    filterName: context.localizedString
                                        .includeOutOfStockProducts,
                                    value: 3,
                                    requestKey:
                                        FilterType.IncludeOutOfStockProducts,
                                    groupKey: FilterType.stock),
                                SearchByProductFilter(
                                    filterName:
                                        context.localizedString.onlyInStock,
                                    value: 4,
                                    requestKey: FilterType.OnlyInStock,
                                    groupKey: FilterType.stock),
                              ]),
                              _buildFiltersSelectionView(
                                  context.localizedString.scheme.toUpperCase(),
                                  [
                                    SearchByProductFilter(
                                        filterName: context.localizedString.all,
                                        value: 5,
                                        requestKey: FilterType.AllScheme,
                                        groupKey: FilterType.scheme),
                                    SearchByProductFilter(
                                        filterName: context.localizedString
                                            .scheme_products_only,
                                        value: 6,
                                        requestKey:
                                            FilterType.OnlySchemeProduct,
                                        groupKey: FilterType.scheme),
                                  ]),
                              _buildFiltersSelectionView(
                                  context.localizedString.expiry.toUpperCase(),
                                  [
                                    SearchByProductFilter(
                                        filterName: context.localizedString.all,
                                        value: 7,
                                        requestKey: FilterType.AllExpiry,
                                        groupKey: FilterType.expiry),
                                    SearchByProductFilter(
                                        filterName: context
                                            .localizedString.expiryHidden,
                                        value: 8,
                                        requestKey: FilterType.HiddenExpiry,
                                        groupKey: FilterType.expiry),
                                    SearchByProductFilter(
                                        filterName: context
                                            .localizedString.expiryVisible,
                                        value: 9,
                                        requestKey: FilterType.VisibleExpiry,
                                        groupKey: FilterType.expiry),
                                  ]),
                              showDistributorList(),
                            ],
                          ),
                        ),
                        Container(
                          color: AppColors.onboardingPageBackgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 15, left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: PrimaryRoundedCornerButton(
                                    text: context.localizedString.resetFilters,
                                    color: context.colors.secondary,
                                    buttonTextStyle: context.textStyles.button2
                                        ?.copyWith(
                                            color: context.colors.primary,
                                            fontWeight: FontWeight.w700),
                                    cornerRadius: 5,
                                    onTap: () {
                                      context.showToastySnackbar(
                                          AppTextStyles
                                              .selectedTabTextStyle12W500(),
                                          'Filters reset successfully!',
                                          AlertType.success);
                                      setState(() {
                                        getIt<SearchProductCubit>()
                                            .resetFilters();
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: PrimaryRoundedCornerButton(
                                      text: context.localizedString.apply,
                                      buttonTextStyle:
                                          context.textStyles.button2?.copyWith(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w700),
                                      cornerRadius: 5,
                                      onTap: () {
                                        context.showToastySnackbar(
                                            AppTextStyles
                                                .selectedTabTextStyle12W500(),
                                            'Filters applied successfully!',
                                            AlertType.success);
                                        getIt<SearchProductCubit>()
                                            .refreshProductList();
                                        Navigator.pop(context);
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildFiltersSelectionView(
      String title, List<SearchByProductFilter> filters) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
          initiallyExpanded: false,
          title: Text(title,
              style: context.textStyles.header9Regular
                  ?.copyWith(color: context.colors.textSecondary)),
          children: [
            Container(
              decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: AppColors.dividerColor))),
              child: Column(children: [
                for (var singleFilter in filters)
                  RadioListTile<int>(
                    title: Text(singleFilter.filterName!,
                        style: context.textStyles.header8Medium),
                    value: singleFilter.value!,
                    groupValue: getIt<SearchProductCubit>()
                            .filtersMap[singleFilter.groupKey!.name]
                            ?.value ??
                        1,
                    onChanged: (value) {
                      setState(() {
                        getIt<SearchProductCubit>().addFilter(singleFilter,
                            singleFilter.copyWith(selectedRadioValue: true));
                      });
                    },
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )
              ]),
            ),
          ]),
    );
  }

  Widget showDistributorList() {
    List<SearchByProductFilter> companyFiltersList = getIt<SearchProductCubit>()
        .distributors
        .map((e) => SearchByProductFilter(
            filterName: e.storeName,
            groupKey: FilterType.AllDistributors,
            isCompanyChecked: e.isDistributorCheck ?? false,
            companyRequestKey: e.storeId ?? -1))
        .toList(growable: true);
    return _buildByDistributorFilters(
        context.localizedString.distributor.toUpperCase(), companyFiltersList);
  }

  Widget _buildByDistributorFilters(
      String title, List<SearchByProductFilter> companyFilters) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(title,
              style: context.textStyles.header9Regular
                  ?.copyWith(color: context.colors.textSecondary)),
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: AppColors.dividerColor))),
              child: Column(children: [
                for (int i = 0; i < companyFilters.length; i++)
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(companyFilters[i].filterName!,
                        style: context.textStyles.header8Medium),
                    value: companyFilters[i].isCompanyChecked,
                    onChanged: (value) {
                      getIt<SearchProductCubit>().addCheckBoxFilter(
                          companyFilters[i].companyRequestKey, value ?? false);
                      setState(() {});
                    },
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )
              ]),
            ),
          ]),
    );
  }
}
