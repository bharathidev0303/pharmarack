import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

class CustomTabWithDivider extends StatefulWidget {
  final List<CustomTabItem> tabs;
  final List<Widget> tabBarViews;
  final Function(int)? onSelectedTab;
  final int selectedIndex;

  const CustomTabWithDivider({
    super.key,
    required this.tabs,
    required this.tabBarViews,
    this.onSelectedTab,
    this.selectedIndex = 0,
  });

  @override
  State<CustomTabWithDivider> createState() => _CustomTabWithDividerState();
}

class _CustomTabWithDividerState extends State<CustomTabWithDivider> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabs.length != widget.tabBarViews.length) {
      throw Exception("Provide same number of tabs and tab_bar views");
    }

    return DefaultTabController(
      initialIndex: currentIndex,
      length: widget.tabs.length,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBorderColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: SizedBox(
              height: 35.0,
              child: TabBar(
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                onTap: _updateCurrentIndex,
                labelColor: Colors.white,
                labelStyle: AppTextStyles.tabTitleTextStyle(),
                unselectedLabelStyle: AppTextStyles.tabTitleTextStyle(
                  color: AppColors.cardTitleNumberColor,
                ),
                unselectedLabelColor: AppColors.cardTitleNumberColor,
                indicator: ShapeDecoration(
                  color: AppColors.cardTitleNumberColor,
                  shape: getTabShapeBasedOnIndex(currentIndex),
                ),
                tabs: widget.tabs,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              // physics: const NeverScrollableScrollPhysics(),
              children: widget.tabBarViews,
            ),
          )
        ],
      ),
    );
  }

  RoundedRectangleBorder getTabShapeBasedOnIndex(int index) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: index == 0 ? const Radius.circular(5) : Radius.zero,
        bottomLeft: index == 0 ? const Radius.circular(5) : Radius.zero,
        topRight: index == 2 ? const Radius.circular(5) : Radius.zero,
        bottomRight: index == 2 ? const Radius.circular(5) : Radius.zero,
      ),
    );
  }

  void _updateCurrentIndex(int value) {
    setState(() {
      widget.onSelectedTab?.call(currentIndex);
      currentIndex = value;
    });
  }
}

class CustomTabItem extends StatelessWidget {
  final bool shouldAddDivider;
  final String tabName;

  const CustomTabItem({
    super.key,
    this.shouldAddDivider = false,
    required this.tabName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Tab(
              child: Text(tabName),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: VerticalDivider(
              width: 1.0,
              thickness: 1.0,
              color: shouldAddDivider
                  ? AppColors.verticalDividerLineColor
                  : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
