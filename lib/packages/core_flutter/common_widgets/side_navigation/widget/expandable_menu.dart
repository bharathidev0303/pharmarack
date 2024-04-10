import 'package:flutter/material.dart';

import '../model/menu.dart';

/// This is expandable menu class this class can handle single and multiple
/// hierarchy of menu as per the given Menu object
class ExpandableMenu extends StatefulWidget {
  final Menu menu;
  final Function(String selectedMenu) callback;
  const ExpandableMenu({super.key, required this.menu, required this.callback});

  @override
  ExpandableMenuState createState() => ExpandableMenuState();
}

class ExpandableMenuState extends State<ExpandableMenu> {
  @override
  Widget build(BuildContext context) {
    if (widget.menu.subMenu.isEmpty) {
      return Builder(builder: (context) {
        return InkWell(
          onTap: () {
            widget.callback(widget.menu.route ?? '');
          },
          child: ListTile(
              leading: const SizedBox(),
              title: Text(
                widget.menu.name ?? '',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              )),
        );
      });
    }
    return ExpansionTile(
      leading: Icon(
        widget.menu.icon,
        size: 20,
      ),
      title: Text(
        widget.menu.name ?? '',
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      children:
          List<Widget>.from(widget.menu.subMenu.map((subMenu) => ExpandableMenu(
                callback: (action) => widget.callback(action),
                menu: subMenu,
              ))),
    );
  }
}
