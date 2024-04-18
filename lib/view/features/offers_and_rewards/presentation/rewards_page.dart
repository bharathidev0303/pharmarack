import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/offers_and_rewards/presentation/rewards_page_mobile_view.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: SecondaryAppBar(titleText: "Rewards"),
      body: SafeArea(
        child: RewardsPageMobileView(),
      ),
    );
  }
}
