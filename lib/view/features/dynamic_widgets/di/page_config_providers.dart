import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/pageConfigModel.dart';

void initPageConfigDi({
  required String pageName,
  BuildContext? context,
  int? storeId,
  String? storeName,
  int? companyId,
  String? companyName,
}) {
  clearPageConfigDi();
  getIt.registerLazySingleton<PageConfigModel>(() => PageConfigModel(
        context: context,
        page: pageName,
        storeId: storeId,
        storeName: storeName,
        companyId: companyId,
        companyName: companyName,
      ));
}

void clearPageConfigDi() {
  getIt.unregister<PageConfigModel>();
}
