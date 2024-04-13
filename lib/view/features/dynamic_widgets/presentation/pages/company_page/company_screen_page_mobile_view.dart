import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/company_page_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/page_config_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/company_page/company_page_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/company_page/company_screen_page.dart';

class CompanyScreenPageMobileView extends StatefulWidget {
  const CompanyScreenPageMobileView({super.key});

  @override
  State<CompanyScreenPageMobileView> createState() =>
      _CompanyScreenPageMobileViewState();
}

class _CompanyScreenPageMobileViewState
    extends State<CompanyScreenPageMobileView> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late CompaniesModel companyInfo;
  @override
  void initState() {
    super.initState();
    clearCompanyPageDi();
    initCompanyPageDi();
    companyInfo = getIt<CompaniesModel>();
    initPageConfigDi(
        pageName: "company_page",
        companyId: companyInfo.companyId,
        companyName: companyInfo.companyName);
    companyPageScreenCubit.fetchCompanyPage(
        cId: companyInfo.companyId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: RefreshIndicator(
        key: refreshIndicatorKey,
        color: AppColors.blueButtonColor,
        onRefresh: () => _refreshPage(context),
        child: BlocBuilder(
          bloc: companyPageScreenCubit,
          buildWhen: (previous, current) {
            return (current is CompanyPageInitialState) ||
                (current is CompanyPageLoadingState) ||
                (current is CompanyPageErrorState) ||
                (current is CompanyPageDataState);
          },
          builder: (context, state) {
            if (state is CompanyPageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CompanyPageErrorState) {
              return Center(
                child: Container(
                  child: AppAssets.svg.icInfoCircleError
                      .svg(width: 30, height: 30),
                ),
              );
            } else if (state is CompanyPageDataState) {
              state.companyPageModel.widget
                  .insert(0, companyPageTittle(context, companyInfo));
              return ListView(
                children: state.companyPageModel.widget,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Future<void> _refreshPage(context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (a, b, c) => const CompanyScreenPage()),
    );
    return;
  }

  @override
  void dispose() {
    super.dispose();
    clearCompanyPageDi();
  }
}

Widget companyPageTittle(context, companyInfo) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => {
              Navigator.pop(context),
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.blueButtonColor,
              weight: 500,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              'Welcome to ${companyInfo.companyName}',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ));
}
