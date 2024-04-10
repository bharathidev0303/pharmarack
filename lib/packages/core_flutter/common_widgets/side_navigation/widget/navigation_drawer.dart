import 'package:flutter/material.dart';

import '../model/menu.dart';
import 'expandable_menu.dart';

class NavDrawer extends StatelessWidget {
  final Function(String selectedMenu) callback;
  final List<Menu> menuList;

  const NavDrawer(this.callback, this.menuList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            return ExpandableMenu(
                menu: menuList[index],
                callback: (selectedMenu) => callback(selectedMenu));
          },
        ),
      ),
    );
  }
}
