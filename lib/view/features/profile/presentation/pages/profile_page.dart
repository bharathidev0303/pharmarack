import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/profile_page_mobile_view.dart';

/// This class [ProfilePage] which is UI screen which display interact with the user
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

/// This class [ProfilePageState] which consume by ProfilePage as page state
class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        titleText: context.localizedString.profile,
        onPressBackButton: () {
          getIt<BottomNavigationCubit>().updateBottomNavigationIndex(0);
        },
        actions: [
          InkWell(onTap: () {}, child: AppAssets.svg.icNotification.svg()),
        ],
      ),
      body: const ProfilePageMobileView(),
      backgroundColor: AppColors.screenContainerBackgroundColor,
    );
  }
}
