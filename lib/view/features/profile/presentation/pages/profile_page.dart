import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/profile_page_mobile_view.dart';

/// This class [ProfilePage] which is UI screen which display interact with the user
class ProfilePage extends StatefulWidget {
  final VoidCallback? onPressBackButton;

  const ProfilePage({super.key, this.onPressBackButton});

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
          widget.onPressBackButton?.call();
        },
        actions: [
          InkWell(
              onTap: () {},
              child: AppAssets.svg.icNotification.svg(package: 'core_flutter')),
        ],
      ),
      body: const ProfilePageMobileView(),
      backgroundColor: AppColors.screenContainerBackgroundColor,
    );
  }
}
