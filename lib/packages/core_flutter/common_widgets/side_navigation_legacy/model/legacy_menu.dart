import 'package:flutter/widgets.dart';

class LegacyMenu {
  String? name;
  String? route;
  ImageProvider? icon;
  List<LegacyMenu> subMenu = [];

  LegacyMenu(this.name, this.subMenu, this.icon);

  LegacyMenu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    route = json['route'];
    if (json['subMenu'] != null) {
      subMenu.clear();
      json['subMenu'].forEach((v) {
        subMenu.add(LegacyMenu.fromJson(v));
      });
    }
  }
}
