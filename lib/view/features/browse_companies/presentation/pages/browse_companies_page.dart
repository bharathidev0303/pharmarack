import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/cubit/browse_companies_cubit.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/pages/browse_companies_page_mobile_view.dart';

/// This class [BrowseCompaniesPage] which is UI screen which display interact with the user
class BrowseCompaniesPage extends StatefulWidget {
  const BrowseCompaniesPage({super.key});

  @override
  BrowseCompaniesPageState createState() => BrowseCompaniesPageState();
}

/// This class [BrowseCompaniesPageState] which consume by BrowseCompaniesPage as page state
class BrowseCompaniesPageState extends State<BrowseCompaniesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.screenBackground,
      appBar: SecondaryAppBar(
        titleText: context.localizedString.browseCompanies,
        shouldHideBack: true,
        actions: [
          InkWell(
            onTap: () {},
            child: AppAssets.svg.icHelpCircle.svg(
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BrowseCompaniesCubit>(
              create: (context) => getIt<BrowseCompaniesCubit>()
                ..fetchCompanies(page: 1, limit: "20"),
            ),
            BlocProvider<SearchCubit>(
              create: (context) => getIt<SearchCubit>(
                instanceName: "browseCompaniesSearch",
              ),
            ),
          ],
          child: const BrowseCompaniesPageMobileView(),
        ),
      ),
    );
  }
}
