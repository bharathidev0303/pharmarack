import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/custom_tab_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/no_records_found.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import '../../../domain/model/search_product/search_product_model.dart';
import '../../cubit/search_product_cubit.dart';
import '../search_product_page_mobile_view.dart';

class SearchProductMappedUnMappedPage extends StatefulWidget {
  final List<SearchProductListModel> mappedList;
  final List<SearchProductListModel> unMappedList;
  final SearchProductCubit searchProductCubit;

  const SearchProductMappedUnMappedPage(
      {super.key,
      required this.mappedList,
      required this.unMappedList,
      required this.searchProductCubit});

  @override
  State<SearchProductMappedUnMappedPage> createState() =>
      SearchProductMappedUnMappedPageStatePageState();
}

class SearchProductMappedUnMappedPageStatePageState
    extends State<SearchProductMappedUnMappedPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    // if (widget.mappedList.isEmpty) {
    //   index = 1;
    // } else if (widget.unMappedList.isEmpty) {
    //   index = 0;
    // }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final value = ModalRoute.of(context)?.settings.arguments;
    if (value is int) {
      index = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomTabWithDivider(
      selectedIndex: index,
      tabs: [
        CustomTabItem(
          tabName: context.localizedString.mappedTabTitle.toUpperCase(),
          shouldAddDivider: true,
        ),
        CustomTabItem(
          tabName: context.localizedString.nonMappedTabTitle.toUpperCase(),
          shouldAddDivider: true,
        ),
      ],
      tabBarViews: [
        widget.mappedList.isNotEmpty
            ? SearchProductPageMobileView(
                productList: widget.mappedList,
                searchProductCubit: widget.searchProductCubit,
              )
            : buildEmptyView(context),
        widget.unMappedList.isNotEmpty
            ? SearchProductPageMobileView(
                productList: widget.unMappedList,
                searchProductCubit: widget.searchProductCubit,
              )
            : buildEmptyView(context),
      ],
    );
  }

  Container buildEmptyView(BuildContext context) {
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
  }
}
