import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/company_page_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/page_config_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/company_page/company_page_state.dart';

class CompanyScreenPageMobileView extends StatefulWidget {
  final int companyId;
  final String companyName;
  const CompanyScreenPageMobileView(
      {super.key, required this.companyId, required this.companyName});

  @override
  State<CompanyScreenPageMobileView> createState() =>
      _CompanyScreenPageMobileViewState();
}

class _CompanyScreenPageMobileViewState
    extends State<CompanyScreenPageMobileView> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    clearCompanyPageDi();
    initCompanyPageDi();
    initPageConfigDi(
        pageName: "company_page",
        companyId: widget.companyId,
        companyName: widget.companyName);
    companyPageScreenCubit.fetchCompanyPage(cId: widget.companyId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
              child: SpinKitFadingCircle(
                color: AppColors.blueButtonColor,
                size: 50.0,
              ),
            );
          } else if (state is CompanyPageErrorState) {
            return Center(
              child: Container(
                child:
                    AppAssets.svg.icInfoCircleError.svg(width: 30, height: 30),
              ),
            );
          } else if (state is CompanyPageDataState) {
            state.companyPageModel.widget
                .insert(0, companyPageTittle(context, widget.companyName));
            return ListView(
              children: state.companyPageModel.widget,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    clearCompanyPageDi();
  }
}

Widget companyPageTittle(context, companyName) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Welcome to $companyName',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ));
}
