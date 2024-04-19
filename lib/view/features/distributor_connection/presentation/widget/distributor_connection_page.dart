import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/custom_tab_bar.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/widget/distributor_connection_add_tab.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/widget/distributor_connection_request_tab.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/di/stockiest_priority_providers.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/distributor_mapped_tab_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/pages/stockiest_priority_page_mobile_view.dart';

class DistributorConnectionPage
    extends BasePage<DistributorConnectionPageState> {
  const DistributorConnectionPage({super.key});

  @override
  DistributorConnectionPageState createState() =>
      DistributorConnectionPageState();
}

class DistributorConnectionPageState extends BaseStatefulPage {
  int index = 0;

  @override
  void initState() {
    super.initState();
    initStockiestDi();
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
  PreferredSizeWidget? buildAppbar() {
    return SecondaryAppBar(
        titleText: context.localizedString.myDistributor,
        actions: [AppAssets.svg.icHelpCircle.svg()]);
  }

  @override
  Widget buildView(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DistributorMappedTabCubit>(
          create: (context) => getIt<DistributorMappedTabCubit>(),
        )
      ],
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.appBarColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: CustomTabWithDivider(
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
            CustomTabItem(
              tabName: context.localizedString.referTabTitle.toUpperCase(),
            ),
          ],
          tabBarViews: [
            const StockiestPriorityPageMobileView(),
            const DistributorConnectionRequestTab(),
            DistributorConnectionAddTab(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() async {
    await clearStockiestDi();
    super.dispose();
  }

  @override
  Color scaffoldBackgroundColor() {
    return AppColors.appBackgroundColor;
  }
}
