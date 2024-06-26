import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/dashboard/cart/di/cart_provider.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/home_page_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/page_config_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/home_page/home_page_state.dart';

class DashboardScreenPageMobileView extends StatefulWidget {
  const DashboardScreenPageMobileView({super.key});

  @override
  State<DashboardScreenPageMobileView> createState() =>
      _DashboardScreenPageMobileViewState();
}

class _DashboardScreenPageMobileViewState
    extends State<DashboardScreenPageMobileView> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    clearHomePageDi();
    initHomePageDi();
    initPageConfigDi(pageName: "home_page");
    homePageScreenCubit.fetchHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          showExitDialog(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: RefreshIndicator(
            key: refreshIndicatorKey,
            color: AppColors.blueButtonColor,
            onRefresh: () => _refreshPage(),
            child: BlocBuilder(
              bloc: homePageScreenCubit,
              buildWhen: (previous, current) {
                return (current is HomePageInitialState) ||
                    (current is HomePageLoadingState) ||
                    (current is HomePageErrorState) ||
                    (current is HomePageDataState);
              },
              builder: (context, state) {
                if (state is HomePageLoadingState) {
                  return const Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.blueButtonColor,
                      size: 50.0,
                    ),
                  );
                } else if (state is HomePageErrorState) {
                  return Center(
                    child: Container(
                      child: AppAssets.svg.icInfoCircleError
                          .svg(width: 30, height: 30),
                    ),
                  );
                } else if (state is HomePageDataState) {
                  return ListView(
                    children: state.homePageModel.widget,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    clearHomePageDi();
  }

  Future<void> _refreshPage() async {
    homePageScreenCubit.fetchHomePage();
    draggableCartScreenCubit.getCartDetails();
    return;
  }
}
