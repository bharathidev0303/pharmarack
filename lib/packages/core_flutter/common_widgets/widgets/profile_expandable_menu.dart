
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/app_expansion_panel.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/legacy_app_color.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/legacy_app_textstyles.dart';
import 'package:pharmarack/gen/assets.gen.dart';

class ProfileExpandableMenu extends StatelessWidget {
  final Function(String selectedMenu) callback;
  final List<LegacyMenu> menuList;

  const ProfileExpandableMenu(this.callback, this.menuList, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomNavDrawer(
      menuList: menuList,
      callback: callback,
    );
  }
}

class CustomNavDrawer extends StatefulWidget {
  final List<LegacyMenu> menuList;
  final Function(String selectedMenu) callback;

  const CustomNavDrawer(
      {super.key, required this.menuList, required this.callback});

  @override
  CustomNavDrawerState createState() => CustomNavDrawerState();
}

class CustomNavDrawerState extends State<CustomNavDrawer> {
  int _expandedIndex = -1; // Track the index of the currently expanded item

  void _handleExpansion(int index) {
    setState(() {
      if (_expandedIndex == index || widget.menuList[index].subMenu.isEmpty) {
        _expandedIndex = -1;
      } else {
        _expandedIndex = index;
      }
    });
  }

  void onMainMenuClicked(int index) {
    widget.callback(widget.menuList[index].route ?? "");
  }

  void onSubMenuClicked(int index, int subIndex) {
    widget.callback(widget.menuList[index].subMenu[subIndex].route ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.menuList.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: getClipRadius(index),
                  child: AppExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: EdgeInsets.zero,
                    expansionCallback: (int iindex, bool isExpanded) {
                      _handleExpansion(index);
                      onMainMenuClicked(index);
                    },
                    children: [
                      AppExpansionPanel(
                        iconBuilder: (child, isExpanded) {
                          if (isExpanded) {
                            return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: AppAssets.svg.chevronDownDark
                                    .svg(package: 'core_flutter'));
                          } else {
                            return InkWell(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: AppAssets.svg.chevronRightDark
                                      .svg(package: 'core_flutter')),
                              onTap: () => onMainMenuClicked(index),
                            );
                          }
                        },
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                            color: AppColors.transparent,
                            child: ListTile(
                              splashColor: Colors.transparent,
                              onTap: () => {
                                _handleExpansion(index),
                                onMainMenuClicked(index),
                              },
                              title: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: [
                                    Image(
                                      image: widget.menuList[index].icon ??
                                          AppAssets.png.close.provider(
                                              package: 'core_flutter'),
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      widget.menuList[index].name ?? "",
                                      style: LegacyAppTextStyles
                                          .listTitleStyle16W500
                                          .copyWith(
                                              color: getExpandedColor(index)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        body: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.menuList[index].subMenu.length,
                          itemBuilder: (ctx, subIndex) {
                            return Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: LegacyAppColor
                                        .drawerContainerBorderColor,
                                  ),
                                ),
                              ),
                              child: ListTile(
                                onTap: () {
                                  onSubMenuClicked(index, subIndex);
                                },
                                leading: Image(
                                  image: widget
                                      .menuList[index].subMenu[subIndex].icon!,
                                  width: 20,
                                  height: 20,
                                ),
                                title: Text(
                                  widget.menuList[index].subMenu[subIndex]
                                          .name ??
                                      "",
                                  style:
                                      LegacyAppTextStyles.listTitleStyle16W500,
                                ),
                              ),
                            );
                          },
                        ),
                        isExpanded: index == _expandedIndex,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: LegacyAppColor.borderColor,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color getColorBasedOnCondition(int index) {
    return index == _expandedIndex
        ? LegacyAppColor.selectedDrawerItemColor
        : Colors.transparent;
  }

  Color getExpandedColor(int index) {
    return index == _expandedIndex
        ? LegacyAppColor.selectedDrawerContentItemColor
        : Colors.black;
  }

  BorderRadius getClipRadius(int index) {
    if (index == 0) {
      return const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10));
    } else if (index == widget.menuList.length - 1) {
      return const BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
    } else {
      return BorderRadius.zero;
    }
  }
}
