import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/page_config_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/rewards_page_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/rewards_page/rewards_page_state.dart';

class RewardsPageMobileView extends StatefulWidget {
  const RewardsPageMobileView({super.key});

  @override
  State<RewardsPageMobileView> createState() => _RewardsPageMobileViewState();
}

class _RewardsPageMobileViewState extends State<RewardsPageMobileView> {
  @override
  void initState() {
    super.initState();
    clearRewardsPageDi();
    initRewardsPageDi();
    initPageConfigDi(pageName: "rewards_page");
    rewardsPageScreenCubit.fetchRewardsPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.screenBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: BlocBuilder(
          bloc: rewardsPageScreenCubit,
          buildWhen: (previous, current) {
            return (current is RewardsPageInitialState) ||
                (current is RewardsPageLoadingState) ||
                (current is RewardsPageErrorState) ||
                (current is RewardsPageDataState);
          },
          builder: (context, state) {
            if (state is RewardsPageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RewardsPageErrorState) {
              return Container();
            } else if (state is RewardsPageDataState) {
              return ListView(
                children: state.rewardsPageModel.widget,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    clearRewardsPageDi();
  }
}
