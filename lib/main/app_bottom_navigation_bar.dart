import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.defaultIndex,
    required this.onSelectedIndex,
  });

  final Function(int) onSelectedIndex;
  final int defaultIndex;

  @override
  State<StatefulWidget> createState() {
    return _CustomBottomNavigationBar();
  }
}

class _CustomBottomNavigationBar extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 79,
      child: BottomNavigationBar(
        key: const Key('bottom_bar'),
        elevation: 0.0,
        selectedLabelStyle: AppTextStyles.bottomNavigationSelectedTextStyle,
        unselectedLabelStyle: AppTextStyles.bottomNavigationUnselectedTextStyle,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.defaultIndex,
        items: getNavigationItems(context),
        onTap: (index) {
          widget.onSelectedIndex(index);
        },
      ),
    );
  }

  List<BottomNavigationBarItem> getNavigationItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
          activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: AppAssets.png.icHomeActive.image(height: 25, width: 35)),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.png.icHomeInactive.image(height: 25, width: 35),
          ),
          label: context.localizedString.home),
      BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.svg.icBrowseActive.svg(height: 25, width: 25),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.svg.icBrowseInactive.svg(height: 25, width: 25),
          ),
          label: context.localizedString.browse),
      BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.svg.icOrderActive.svg(height: 25, width: 25),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.svg.icOrderInactive.svg(height: 25, width: 25),
          ),
          label: context.localizedString.orders),
      BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.svg.icProfileActive.svg(height: 25, width: 25),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.svg.icProfileInactive.svg(height: 25, width: 25),
          ),
          label: context.localizedString.profile),
      BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.svg.icCartActive.svg(height: 25, width: 25),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AppAssets.svg.icCartInactive.svg(height: 25, width: 25),
          ),
          label: context.localizedString.cart),
    ];
  }
}
