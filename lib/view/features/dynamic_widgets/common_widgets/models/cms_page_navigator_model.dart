import 'package:flutter/material.dart';

class CmsPageNavigatorModel {
  final BuildContext context;
  final String? linkType;
  final String? linkTo;
  final String? linkToExtra;
  final String? title;
  final int? storeId;
  final String? storeName;
  final int? companyId;
  final String? companyName;

  CmsPageNavigatorModel(
      {required this.context,
      this.linkType,
      this.linkTo,
      this.linkToExtra,
      this.title,
      this.storeId,
      this.storeName,
      this.companyId,
      this.companyName});

  CmsPageNavigatorModel copyWith({
    required String contextType,
    String? linkType,
    String? linkTo,
    String? linkToExtra,
    String? title,
    int? storeId,
    String? storeName,
    int? companyId,
    String? companyName,
  }) {
    return CmsPageNavigatorModel(
      context: context,
      linkType: linkType ?? this.linkType,
      linkTo: linkTo ?? this.linkTo,
      linkToExtra: linkToExtra ?? this.linkToExtra,
      title: title ?? this.title,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
    );
  }
}
