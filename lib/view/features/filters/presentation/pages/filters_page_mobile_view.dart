import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_rounder_corner_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/filters/domain/model/filters/filter_type.dart';
import 'package:pharmarack/view/features/filters/presentation/pages/widgets/search_by_product_filter.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_state.dart';
// import 'package:retailer/features/search_product/data/entity/molecule_and_company_model.dart';

/// This class [FiltersPageMobileView] which specifically used to render Mobile UI
class FiltersPageMobileView extends StatefulWidget {
  final Function? callBack;
  const FiltersPageMobileView({super.key, required this.callBack});

  @override
  State<StatefulWidget> createState() => FiltersPageMobileViewState();
}

class FiltersPageMobileViewState extends State<FiltersPageMobileView> {
  int? searchBySelectedValue;
  //int? distributorSelectedValue;
  int? stockSelectedValue;
  int? schemeSelectedValue;
  int? expirySelectedValue;

  @override
  void initState() {
    super.initState();
    getIt<SearchProductCubit>().addInitialData();
    // getIt<SearchProductCubit>().getMoleculeAndCompanies("", "");
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
                            //Navigator.pop(context);
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
                              _buildSearchByFilters(
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
                              // _buildDistributorFilters(
                              //     context.localizedString.distributors
                              //         .toUpperCase(),
                              //     [
                              //       SearchByProductFilter(
                              //           filterName: context.localizedString.all,
                              //           value: 3,
                              //           requestKey: FilterType.AllDistributors,
                              //           groupKey: FilterType.distributors),
                              //       SearchByProductFilter(
                              //           filterName:
                              //               context.localizedString.mapped,
                              //           value: 4,
                              //           requestKey:
                              //               FilterType.MappedDistributors,
                              //           groupKey: FilterType.distributors),
                              //       SearchByProductFilter(
                              //           filterName:
                              //               context.localizedString.nonMapped,
                              //           value: 5,
                              //           requestKey:
                              //               FilterType.NonMappedDistributors,
                              //           groupKey: FilterType.distributors)
                              //     ]),
                              _buildStockFilters(
                                  context.localizedString.stock.toUpperCase(), [
                                SearchByProductFilter(
                                    filterName:
                                        context.localizedString.onlyInStock,
                                    value: 6,
                                    requestKey: FilterType.OnlyInStock,
                                    groupKey: FilterType.stock),
                                SearchByProductFilter(
                                    filterName: context.localizedString
                                        .includeOutOfStockProducts,
                                    value: 7,
                                    requestKey:
                                        FilterType.IncludeOutOfStockProducts,
                                    groupKey: FilterType.stock),
                              ]),
                              _buildSchemeFilters(
                                  context.localizedString.scheme.toUpperCase(),
                                  [
                                    SearchByProductFilter(
                                        filterName: context.localizedString.all,
                                        value: 8,
                                        requestKey: FilterType.AllScheme,
                                        groupKey: FilterType.scheme),
                                    SearchByProductFilter(
                                        filterName: context.localizedString
                                            .scheme_products_only,
                                        value: 9,
                                        requestKey:
                                            FilterType.OnlySchemeProduct,
                                        groupKey: FilterType.scheme),
                                  ]),
                              _buildExpiryFilters(
                                  context.localizedString.expiry.toUpperCase(),
                                  [
                                    SearchByProductFilter(
                                        filterName: context.localizedString.all,
                                        value: 10,
                                        requestKey: FilterType.AllExpiry,
                                        groupKey: FilterType.expiry),
                                    SearchByProductFilter(
                                        filterName: context
                                            .localizedString.expiryHidden,
                                        value: 11,
                                        requestKey: FilterType.HiddenExpiry,
                                        groupKey: FilterType.expiry),
                                    SearchByProductFilter(
                                        filterName: context
                                            .localizedString.expiryVisible,
                                        value: 12,
                                        requestKey: FilterType.VisibleExpiry,
                                        groupKey: FilterType.expiry),
                                  ]),
                              // BlocBuilder<SearchProductCubit,
                              //         SearchProductState>(
                              //     bloc: getIt<SearchProductCubit>(),
                              //     builder: (context, state) {
                              //       if (state is CompanyFiltersDataState) {
                              //         List<Company> companyList = state
                              //                 .moleculeAndCompanyModel
                              //                 .company ??
                              //             List.empty();
                              //         List<SearchByProductFilter>
                              //             companyFiltersList = companyList
                              //                 .map((e) => SearchByProductFilter(
                              //                     filterName: e.companyName,
                              //                     groupKey:
                              //                         FilterType.AllCompanies,
                              //                     isCompanyChecked:
                              //                         e.isChecked ?? false,
                              //                     companyRequestKey:
                              //                         e.companyId ?? -1))
                              //                 .toList(growable: true);
                              //         return _buildByCompanyFilters(
                              //             companyList,
                              //             context.localizedString.byCompany
                              //                 .toUpperCase(),
                              //             companyFiltersList);
                              //       } else {
                              //         return const SizedBox.shrink();
                              //       }
                              //     })
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
                                      setState(() {
                                        getIt<SearchProductCubit>()
                                            .resetFilters();
                                      });
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
                                        // getIt<SearchProductCubit>()
                                        //     .fetchProduct();
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

  Widget _buildSearchByFilters(
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
                    groupValue: searchBySelectedValue ??
                        getIt<SearchProductCubit>()
                            .filtersMap[singleFilter.groupKey!.name]
                            ?.value ??
                        1,
                    onChanged: (value) {
                      setState(() {
                        searchBySelectedValue = value!;
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

  // Widget _buildDistributorFilters(
  //     String title, List<SearchByProductFilter> filters) {
  //   return Theme(
  //     data: ThemeData().copyWith(dividerColor: Colors.transparent),
  //     child: ExpansionTile(
  //         initiallyExpanded: false,
  //         title: Text(title,
  //             style: context.textStyles.header9Regular
  //                 ?.copyWith(color: context.colors.textSecondary)),
  //         children: [
  //           Container(
  //             decoration: ShapeDecoration(
  //                 color: AppColors.white,
  //                 shape: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                     borderSide:
  //                         const BorderSide(color: AppColors.dividerColor))),
  //             child: Column(children: [
  //               for (var singleFilter in filters)
  //                 RadioListTile<int>(
  //                   title: Text(singleFilter.filterName!,
  //                       style: context.textStyles.header8Medium),
  //                   value: singleFilter.value!,
  //                   groupValue: distributorSelectedValue ??
  //                       getIt<SearchProductCubit>()
  //                           .filtersMap[singleFilter.groupKey!.name]
  //                           ?.value ??
  //                       -1,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       distributorSelectedValue = value!;
  //                       getIt<SearchProductCubit>().addFilter(singleFilter,
  //                           singleFilter.copyWith(selectedRadioValue: true));
  //                     });
  //                   },
  //                   visualDensity: const VisualDensity(
  //                     horizontal: VisualDensity.minimumDensity,
  //                     vertical: VisualDensity.minimumDensity,
  //                   ),
  //                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //                 )
  //             ]),
  //           ),
  //         ]),
  //   );
  // }

  // This code is commented because the corresponding API parameters are missing in search api.
  //  uncomment this whenever the api params get available and add this UI element into UI

  Widget _buildStockFilters(String title, List<SearchByProductFilter> filters) {
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
                    groupValue: stockSelectedValue ??
                        getIt<SearchProductCubit>()
                            .filtersMap[singleFilter.requestKey!.name]
                            ?.value ??
                        6,
                    onChanged: (value) {
                      setState(() {
                        stockSelectedValue = value!;
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

  Widget _buildSchemeFilters(
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
                    groupValue: schemeSelectedValue ??
                        getIt<SearchProductCubit>()
                            .filtersMap[singleFilter.groupKey!.name]
                            ?.value ??
                        -1,
                    onChanged: (value) {
                      setState(() {
                        schemeSelectedValue = value!;
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

  // This code is commented because the corresponding API parameters are missing in search api.
  //  uncomment this whenever the api params get available and add this UI element into UI
  Widget _buildExpiryFilters(
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
                    groupValue: expirySelectedValue ??
                        getIt<SearchProductCubit>()
                            .filtersMap[singleFilter.requestKey!.name]
                            ?.value ??
                        10,
                    onChanged: (value) {
                      setState(() {
                        expirySelectedValue = value!;
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

  // Widget _buildByCompanyFilters(List<Company> allCompanies, String title,
  //     List<SearchByProductFilter> companyFilters) {
  //   return Theme(
  //     data: ThemeData().copyWith(dividerColor: Colors.transparent),
  //     child: ExpansionTile(
  //         initiallyExpanded: true,
  //         title: Text(title,
  //             style: context.textStyles.header9Regular
  //                 ?.copyWith(color: context.colors.textSecondary)),
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.all(5),
  //             decoration: ShapeDecoration(
  //                 color: AppColors.white,
  //                 shape: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                     borderSide:
  //                         const BorderSide(color: AppColors.dividerColor))),
  //             child: Column(children: [
  //               for (int i = 0; i < companyFilters.length; i++)
  //                 CheckboxListTile(
  //                   controlAffinity: ListTileControlAffinity.leading,
  //                   title: Text(companyFilters[i].filterName!,
  //                       style: context.textStyles.header8Medium),
  //                   value: companyFilters[i].isCompanyChecked,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       getIt<SearchProductCubit>().addCheckBoxFilter(
  //                           companyFilters[i].companyRequestKey,
  //                           value ?? false);
  //                     });
  //                   },
  //                   visualDensity: const VisualDensity(
  //                     horizontal: VisualDensity.minimumDensity,
  //                     vertical: VisualDensity.minimumDensity,
  //                   ),
  //                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //                 )
  //             ]),
  //           ),
  //         ]),
  //   );
  // }
}
