import 'package:flutter/material.dart';
import 'package:pharmarack/view/features/dynamic_widgets/DynamicWidgetBuilder.dart';

class DynamicWidgetModel {
  final Map<String, dynamic> components;
  final List<Widget> widget;
  DynamicWidgetModel({
    required this.components,
    required this.widget,
  });

  factory DynamicWidgetModel.fromJson(Map<String, dynamic> json) {
    List<Widget> widget = buildWidgetsFromJsonData(json);
    return DynamicWidgetModel(components: json, widget: widget);
  }
}
