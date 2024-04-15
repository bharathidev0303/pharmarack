import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/widgets/dropdown/distributor_drop_down/cubit/distributor_drop_down_cubit.dart';
import 'package:pharmarack/view/features/widgets/dropdown/distributor_drop_down/distributor_drop_down_list_item.dart';

import '../../custom_app_bar/custom_app_bar_cubit.dart';

class DistributorDropDownView extends StatefulWidget {
  final Function(int, String, String)? getIdCallback;
  final double inputWidth;
  final DistributorDropDownCubit cubit;
  final String page;

  const DistributorDropDownView(
      {super.key,
      required this.inputWidth,
      this.getIdCallback,
      required this.cubit,
      required this.page});

  @override
  State<DistributorDropDownView> createState() =>
      _DistributorDropDownViewState();
}

class _DistributorDropDownViewState extends State<DistributorDropDownView> {
  @override
  void initState() {
    super.initState();
    setUp();
  }

  setUp() async {
    await widget.cubit.fetchStockiestPriority(widget.page);
    widget.cubit.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          border: Border.all(width: 1, color: AppColors.white300)),
      width: widget.inputWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder(
            bloc: widget.cubit,
            builder: (context, state) {
              if (state is DistributorFilteredDataState) {
                final mappedList = state.mappedList;
                final unMappedList = state.unMappedList;
                return Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minHeight: 50, maxHeight: 294),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          mappedList.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              context.localizedString
                                                  .yourDistributorsTitle
                                                  .toUpperCase(),
                                              style: AppTextStyles
                                                  .searchFilterTitleStyleW300
                                                  .copyWith(
                                                      color:
                                                          AppColors.lightGrey)),
                                          InkWell(
                                            onTap: () {
                                              getIt<CustomAppBarCubit>()
                                                  .closeDistributorDropdown();
                                              Navigator.pushNamed(
                                                  context,
                                                  RoutePaths
                                                      .distributorConnection);
                                            },
                                            child: Text(
                                                context.localizedString
                                                    .editPreference
                                                    .toUpperCase(),
                                                style: AppTextStyles
                                                    .searchFilterTitleStyleW300
                                                    .copyWith(
                                                        color: AppColors
                                                            .secondaryButtonTextColor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        widget.getIdCallback?.call(0, '', '');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Text(
                                              'All',
                                              style: AppTextStyles
                                                  .style12W700Black(),
                                              maxLines: 1,
                                            ),
                                          ),
                                          AppAssets.svg.blueArrowUpRight
                                              .svg(height: 20, width: 20)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onPanDown: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        },
                                        child: ListView.builder(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          keyboardDismissBehavior:
                                              ScrollViewKeyboardDismissBehavior
                                                  .onDrag,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: mappedList.length,
                                          itemBuilder: (context, index) {
                                            final product = mappedList[index];
                                            return InkWell(
                                              onTap: () {
                                                final id = state
                                                        .mappedList[index]
                                                        .storeId ??
                                                    0;
                                                final companyId = state
                                                        .mappedList[index]
                                                        .companyId ??
                                                    '';
                                                final storeName = state
                                                        .mappedList[index]
                                                        .storeName ??
                                                    "";
                                                widget.getIdCallback?.call(
                                                    id,
                                                    storeName,
                                                    companyId.toString());
                                              },
                                              child: Column(
                                                children: [
                                                  DropDownListItem(
                                                      title: product.storeName),
                                                  index == mappedList.length - 1
                                                      ? const SizedBox.shrink()
                                                      : const Divider(
                                                          thickness: 1,
                                                          color: AppColors
                                                              .borderColor,
                                                        ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          unMappedList.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          top: mappedList.isEmpty ? 0 : 20),
                                      child: Text(
                                          context.localizedString
                                              .nonMappedDistributors
                                              .toUpperCase(),
                                          style: AppTextStyles
                                              .searchFilterTitleStyleW300
                                              .copyWith(
                                                  color: AppColors.lightGrey)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, bottom: 8),
                                      child: ListView.builder(
                                        padding: const EdgeInsets.only(top: 0),
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: unMappedList.length,
                                        itemBuilder: (context, index) {
                                          final product = unMappedList[index];
                                          return InkWell(
                                            onTap: () {
                                              final id = state
                                                      .unMappedList[index]
                                                      .storeId ??
                                                  0;
                                              final companyId = state
                                                      .unMappedList[index]
                                                      .companyId ??
                                                  0;
                                              final storeName = state
                                                      .unMappedList[index]
                                                      .storeName ??
                                                  "";
                                              widget.getIdCallback?.call(
                                                  id,
                                                  storeName,
                                                  companyId.toString());
                                            },
                                            child: Column(
                                              children: [
                                                DropDownListItem(
                                                    title: product.storeName),
                                                index == unMappedList.length - 1
                                                    ? const SizedBox.shrink()
                                                    : const Divider(
                                                        thickness: 1,
                                                        color: AppColors
                                                            .borderColor,
                                                      ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is DistributorDropDownEmptyState) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(context.localizedString.noDistributorFound),
                ));
              } else {
                return Center(
                  child: Container(
                    height: 25,
                    width: 25,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    child: const SpinKitFadingCircle(
                      color: AppColors.blueButtonColor,
                      size: 50.0,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
