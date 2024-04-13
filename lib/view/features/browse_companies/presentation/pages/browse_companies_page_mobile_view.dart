import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/no_records_found.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/cubit/browse_companies_cubit.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/cubit/browse_companies_state.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/pages/browse_company_list_item.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/pages/filter_companies_modal_bottom.dart';

/// This class [BrowseCompaniesPageMobileView] which specifically used to render Mobile UI

class BrowseCompaniesPageMobileView extends StatefulWidget {
  const BrowseCompaniesPageMobileView({super.key});

  @override
  State<BrowseCompaniesPageMobileView> createState() =>
      _BrowseCompaniesPageMobileViewState();
}

class _BrowseCompaniesPageMobileViewState
    extends State<BrowseCompaniesPageMobileView> {
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool pageNation = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (pageNation) {
          BlocProvider.of<BrowseCompaniesCubit>(context)
              .updateCompaniesPage(page: ++_page, limit: "20");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCompaniesCubit, BrowseCompaniesState>(
      builder: (context, state) {
        if (state.browseCompanyMessage is BrowseCompanyNone ||
            state.browseCompanyMessage is BrowseCompanyLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.browseCompanyMessage == CompanyListLimitReached()) {
          pageNation = false;
        }
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextInputField(
                      hint: Row(
                        children: [
                          AppAssets.svg.icSearch.svg(
                            width: 16,
                            height: 16,
                            colorFilter: ColorFilter.mode(
                              context.colors.textSecondary!,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            context.localizedString.searchByCompany,
                            style: context.textStyles.header6Regular?.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      textInputAction: TextInputAction.search,
                      onChanged: (text) {
                        context.read<SearchCubit>().updateSearchQuery(text);
                        context
                            .read<BrowseCompaniesCubit>()
                            .searchCompanies(text);
                      },
                    ),
                  ),
                  const SizedBox(width: 14),
                  InkWell(
                    key: const Key("filterKey"),
                    onTap: () {
                      _showFilterBottomSheet(context, state.therapies);
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: state.therapies.isEmpty
                          ? AppAssets.svg.settings.svg(
                              key: ValueKey(state.therapies),
                              width: 24,
                              height: 24,
                            )
                          : SizedBox(
                              key: ValueKey(state.therapies),
                              width: 24,
                              height: 24,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: context.colors.offers,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        "${state.therapies.length}",
                                        style: context.textStyles.header12Medium
                                            ?.copyWith(
                                          fontSize: 8,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: AppAssets.svg.settings.svg(
                                      width: 14,
                                      height: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: state.therapies.isNotEmpty,
                child: SizedBox(
                  height: 41,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.therapies.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Chip(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: context.colors.inputField!),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                label: Text(
                                  state.therapies[index],
                                  style: context.textStyles.paragraph1Regular,
                                ),
                                onDeleted: () {
                                  context
                                      .read<BrowseCompaniesCubit>()
                                      .removeFilter(state.therapies[index],
                                          context.read<SearchCubit>().state);
                                },
                                deleteIcon: AppAssets.svg.icClose.svg(
                                  width: 12,
                                  height: 12,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    const SliverPadding(padding: EdgeInsets.only(top: 18)),
                    SliverList.builder(
                      itemCount: state.companies.length,
                      itemBuilder: (ctx, index) {
                        if (state.companies.length == 0) {
                          return Container(
                              color: AppColors.white,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: NoRecordsFound(
                                    icons: AppAssets.svg.noDataFound.svg(),
                                    message:
                                        context.localizedString.noDataFound,
                                  )));
                        } else if (state.companies.length > index + 1 ||
                            pageNation == false) {
                          return BrowseCompanyListItem(
                            companiesModel: state.companies[index],
                          );
                        } else if (state.companies.length >= 10) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFilterBottomSheet(BuildContext ctx, List<String> therapies) {
    showModalBottomSheet(
      useRootNavigator: false,
      isScrollControlled: true,
      context: ctx,
      builder: (context) {
        return FilterCompaniesModalBottom(
          therapies: therapies,
        );
      },
    ).then((value) {
      if (value != null) {
        ctx
            .read<BrowseCompaniesCubit>()
            .filterCompanies(value, ctx.read<SearchCubit>().state);
      }
    });
  }
}
