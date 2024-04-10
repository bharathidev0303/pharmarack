
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/app_expansion_panel.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/legacy_app_color.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/legacy_app_textstyles.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class LegacyNavDrawer extends StatelessWidget {
  final Function(String selectedMenu) callback;
  final List<LegacyMenu> menuList;

  const LegacyNavDrawer(this.callback, this.menuList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: CustomNavDrawer(
        menuList: menuList,
        callback: callback,
      ),
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
      if (_expandedIndex == index) {
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
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: LegacyAppColor.drawerBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: Container(
            alignment: Alignment.centerLeft,
            color: LegacyAppColor.drawerHomeIconContainerColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    context.localizedString.home,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: widget.menuList.length,
                (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: LegacyAppColor.drawerContainerBorderColor,
                        ),
                      ),
                    ),
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
                            return null;
                          },
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Container(
                              color: getColorBasedOnCondition(index),
                              child: ListTile(
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: getExpandedColor(index),
                                ),
                                splashColor: Colors.transparent,
                                onTap: () => {
                                  _handleExpansion(index),
                                  onMainMenuClicked(index),
                                },
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 22.0),
                                  child: Text(
                                    widget.menuList[index].name ?? "",
                                    style: LegacyAppTextStyles
                                        .listTitleStyle16W500
                                        .copyWith(
                                            color: getExpandedColor(index)),
                                  ),
                                ),
                              ),
                            );
                          },
                          body: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 0,
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
                                    //onSubMenuClicked(index, subIndex);
                                  },
                                  leading: Image(
                                    image: widget.menuList[index].icon!,
                                    width: 20,
                                    height: 20,
                                  ),
                                  title: Text(
                                    widget.menuList[index].name ?? "",
                                    style: LegacyAppTextStyles
                                        .listTitleStyle16W500,
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
              ),
            ),
          ],
        ),
      ),
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
}
