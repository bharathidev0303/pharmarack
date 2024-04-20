import 'package:flutter/material.dart';

class PageConfigModel {
  final BuildContext? context;
  final String? page;
  final int? companyId;
  final int? storeId;
  final String? companyName;
  final String? storeName;

  PageConfigModel({
    this.context,
    this.page,
    this.companyId,
    this.storeId,
    this.companyName,
    this.storeName,
  });

  PageConfigModel copyWith({
    String? page,
    BuildContext? context,
    int? companyId,
    int? storeId,
    String? companyName,
    String? storeName,
  }) {
    return PageConfigModel(
      context: context ?? this.context,
      page: page ?? this.page,
      companyId: companyId ?? this.companyId,
      storeId: storeId ?? this.storeId,
      companyName: companyName ?? this.companyName,
      storeName: storeName ?? this.storeName,
    );
  }
}
