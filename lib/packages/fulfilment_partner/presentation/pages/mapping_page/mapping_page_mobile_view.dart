import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation/widget/bottom_nav_bar.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/mapped_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/request_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/pages/mapping_page/mapped_tab/mapped_tab_view.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/pages/mapping_page/request_tab/request_tab_view.dart';

/// This class [MappingPageMobileView] which specifically used to render Mobile UI
class MappingPageMobileView extends StatelessWidget {
  const MappingPageMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
            child: Stack(
              children: [
                TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  indicatorColor: Colors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: const TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                  indicator: const ShapeDecoration(
                    shape: Border(
                      bottom: BorderSide(color: Colors.orange),
                    ),
                  ),
                  tabs: [
                    Tab(text: context.localizedString.requestTabTitle),
                    Tab(text: context.localizedString.mappedTabTitle),
                  ],
                  onTap: (index) {
                    if (index == 0) {
                      getIt<SearchCubit>().clear();
                      getIt<RequestCubit>().getRequestedFulfillmentPartner(
                          getIt<String>(
                              instanceName:
                                  FulfilmentPartnerOptions.moduleName));
                    } else if (index == 1) {
                      getIt<SearchCubit>().clear();
                      getIt<MappedCubit>().getMappedSettingsRequests();
                    }
                  },
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 1.0, // Width of the line
                      color: Colors.grey.withOpacity(0.7),
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                RequestTabView(),
                MappedTabView(),
              ],
            ),
          ),
          const BottomNavBar()
        ],
      ),
    );
  }
}
