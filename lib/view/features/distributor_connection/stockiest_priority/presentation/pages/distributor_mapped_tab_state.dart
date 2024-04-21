import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/distributor_mapped_tab_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/save_priority_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/pages/stockist_mapped_non_mapped_dialog.dart';

import '../../../presentation/widget/non_mapped_distributor_list_item.dart';
import '../../data/endpoints_constants/stockiest_priority_options.dart';

class DistributorMappedTabState extends StatefulWidget {
  final List<StockiestPriorityModel> stockiestList;
  final List<DistributorStoreModel> distributorsList;

  const DistributorMappedTabState({
    super.key,
    required this.stockiestList,
    required this.distributorsList,
  });

  @override
  State<DistributorMappedTabState> createState() =>
      _DistributorMappedTabStateState();
}

class _DistributorMappedTabStateState extends State<DistributorMappedTabState> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 10),
            child: Text(
              context.localizedString.createDistributorPrefList,
              style: AppTextStyles.searchHintTextStyleW400().copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 10),
                      child: Text(
                        context.localizedString.mappedDistributor,
                        style: AppTextStyles.searchHintTextStyleW400().copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SliverVisibility(
                    visible: widget.stockiestList.isNotEmpty,
                    replacementSliver: SliverToBoxAdapter(
                      child: Container(
                        key: const Key("mappedKey"),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            context.localizedString.noDistributorsFound,
                            style: AppTextStyles.searchHintTextStyle11W400(),
                          ),
                        ),
                      ),
                    ),
                    sliver: SliverReorderableList(
                      proxyDecorator: (child, index, animation) => child,
                      itemBuilder: (ctx, index) {
                        return ReorderableDelayedDragStartListener(
                          key: Key('$index'),
                          index: index,
                          enabled: getIt<SearchCubit>().state.isEmpty,
                          child: Card(
                            surfaceTintColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                  color: AppColors.cardBorderColor),
                            ),
                            child: SizedBox(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.cardRectangleColor,
                                      ),
                                      child: Text(
                                        widget.stockiestList[index].displayIndex
                                            .toString(),
                                        style: AppTextStyles
                                            .searchHintTextStyleW400(
                                          color: AppColors.cardTitleNumberColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                widget.stockiestList[index]
                                                        .storeName!
                                                        .trim() ??
                                                    "",
                                                style: AppTextStyles
                                                    .searchHintTextStyleW400(
                                                  color:
                                                      AppColors.cardTitleColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    AppAssets.svg.icHamburger.svg(
                                      width: 20,
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: widget.stockiestList.length,
                      onReorder: (oldIndex, newIndex) {
                        _reorderCardItems(oldIndex, newIndex);
                      },
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 15)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 10),
                      child: Text(
                        context.localizedString.nonMappedDistributorsTitle,
                        style: AppTextStyles.searchHintTextStyleW400().copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SliverVisibility(
                    visible: widget.distributorsList.isNotEmpty,
                    replacementSliver: SliverToBoxAdapter(
                      child: Container(
                        key: const Key("nonMappedKey"),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            context.localizedString.noDistributorsFound,
                            style: AppTextStyles.searchHintTextStyle11W400(),
                          ),
                        ),
                      ),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: widget.distributorsList.length,
                        (context, index) {
                          final store = widget.distributorsList[index];
                          final isMappingRequestSent =
                              store.status == StockiestPriorityOptions.pending;
                          return NonMappedDistributorListItem(
                            key: ValueKey(index),
                            storeName: store.storeName ?? "",
                            address: store.address ?? "",
                            isMappingRequestSent: isMappingRequestSent,
                            onClickAction: () {
                              getIt<SearchCubit>(instanceName: "partyCode")
                                  .clear();
                              showStockiestNonMappedDialog(context, store);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _reorderCardItems(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = widget.stockiestList.removeAt(oldIndex);
      widget.stockiestList
          .insert(newIndex, item.copyWith(displayIndex: (newIndex + 1)));

      for (int i = 0; i < widget.stockiestList.length; ++i) {
        widget.stockiestList[i] =
            widget.stockiestList[i].copyWith(displayIndex: (i + 1));
      }
      getIt<DistributorMappedTabCubit>()
          .updateListWhenListReorder(widget.stockiestList);
      getIt<SavePriorityCubit>().saveDistributorPriorities(
        getIt<RetailerInfoEntity>().userId ?? -1,
        widget.stockiestList,
      );
    });
  }
}
