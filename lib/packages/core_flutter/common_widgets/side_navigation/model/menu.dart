import 'package:flutter/widgets.dart';

class Menu {
  String? name;
  String? route;
  IconData? icon;
  List<Menu> subMenu = [];

  Menu(this.name, this.subMenu, this.icon);

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    route = json['route'];
    if (json['subMenu'] != null) {
      subMenu.clear();
      json['subMenu'].forEach((v) {
        subMenu.add(Menu.fromJson(v));
      });
    }
  }
}
