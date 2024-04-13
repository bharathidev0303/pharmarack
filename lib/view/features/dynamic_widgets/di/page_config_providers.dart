import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/pageConfigModel.dart';

void initPageConfigDi({
  required String pageName,
  int? storeId,
  String? storeName,
  int? companyId,
  String? companyName,
}) {
  clearPageConfigDi();
  getIt.registerFactory<PageConfigModel>(
    () => PageConfigModel(
      page: pageName,
      storeId: storeId,
      storeName: storeName,
      companyId: companyId,
      companyName: companyName,
    ),
  );
}

void clearPageConfigDi() {
  getIt.unregister<PageConfigModel>();
}
