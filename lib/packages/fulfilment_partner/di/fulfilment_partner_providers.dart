import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/api_service/fulfilment_partner_api_service.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/data_source/remote_data_source/fulfilment_partner_remote_data_source.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/repository/fulfilment_partner_repository_impl.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/repository/fulfilment_partner_repository.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/approve_reject_mapping_request_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/mapped_settings_search_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/mapped_settings_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/request_cubit_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/request_search_filter_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/saved_mapped_settings_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/mapped_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/request_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/settings_cubit.dart';

final getIt = GetIt.instance;

void initializeFeatureApiServiceAndRepository(String moduleName) {
  if (!getIt.isRegistered<FulfilmentPartnerApiService>()) {
    final fulfilmentPartnerApiService = getIt.registerSingleton<
            FulfilmentPartnerApiService>(
        FulfilmentPartnerApiService(
            getIt<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant)));
    final fulfilmentPartnerRemoteDataSource =
        getIt.registerSingleton<FulfilmentPartnerRemoteDataSource>(
            FulfilmentPartnerRemoteDataSource(fulfilmentPartnerApiService));

    getIt.registerSingleton<FulfilmentPartnerRepository>(
        FulfilmentPartnerRepositoryImpl(fulfilmentPartnerRemoteDataSource));

    getIt.registerSingleton<String>(moduleName,
        instanceName: FulfilmentPartnerOptions.moduleName);
  }
}

void disposeFeatureApiServiceAndRepository() {
  getIt.unregister<String>(instanceName: FulfilmentPartnerOptions.moduleName);
  getIt.unregister<FulfilmentPartnerApiService>();
  getIt.unregister<FulfilmentPartnerRemoteDataSource>();
  getIt.unregister<FulfilmentPartnerRepository>();
}

void initializeMappingDependencies() {
  /// request use case and cubit
  final requestCubitUseCase = getIt.registerSingleton<RequestCubitUseCase>(
      RequestCubitUseCase(getIt<FulfilmentPartnerRepository>()));

  final requestSearchUseCase =
      getIt.registerSingleton<RequestSearchUseCase>(RequestSearchUseCase([]));

  final approveRejectMappingUseCase =
      getIt.registerSingleton<ApproveRejectMappingUseCase>(
          ApproveRejectMappingUseCase(getIt<FulfilmentPartnerRepository>()));

  final searchCubit = getIt.registerSingleton<SearchCubit>(SearchCubit(""));

  final mappedSettingsUseCase = getIt.registerSingleton<MappedSettingsUseCase>(
      MappedSettingsUseCase(getIt<FulfilmentPartnerRepository>()));

  final mappedSettingsSearchUseCase =
      getIt.registerSingleton<MappedSettingsSearchUseCase>(
          MappedSettingsSearchUseCase([]));

  getIt.registerSingleton<RequestCubit>(RequestCubit(requestCubitUseCase,
      requestSearchUseCase, approveRejectMappingUseCase, searchCubit));

  getIt.registerSingleton<MappedCubit>(MappedCubit(
      mappedSettingsUseCase, mappedSettingsSearchUseCase, searchCubit));
}

/// Disposing dependencies
void disposeMappingDependencies() {
  getIt.unregister<MappedSettingsSearchUseCase>();
  getIt.unregister<MappedSettingsUseCase>();
  getIt.unregister<MappedCubit>();
  getIt.unregister<SearchCubit>();
  getIt.unregister<RequestCubit>();
  getIt.unregister<ApproveRejectMappingUseCase>();
  getIt.unregister<RequestSearchUseCase>();
  getIt.unregister<RequestCubitUseCase>();
}

void initializeSettingsDependencies() {
  final saveMappedSettingsUseCase =
      getIt.registerSingleton<SavedMappedSettingsUseCase>(
          SavedMappedSettingsUseCase(getIt<FulfilmentPartnerRepository>()));

  final mappedSettingsUseCase = getIt.registerSingleton<MappedSettingsUseCase>(
      MappedSettingsUseCase(getIt<FulfilmentPartnerRepository>()));

  final mappedSettingsSearchUseCase =
      getIt.registerSingleton<MappedSettingsSearchUseCase>(
          MappedSettingsSearchUseCase([]));

  final searchCubit = getIt.registerSingleton<SearchCubit>(SearchCubit(""));

  getIt.registerSingleton<SettingsCubit>(SettingsCubit(mappedSettingsUseCase,
      mappedSettingsSearchUseCase, saveMappedSettingsUseCase, searchCubit));
}

void disposeSettingsDependencies() {
  getIt.unregister<SavedMappedSettingsUseCase>();
  getIt.unregister<MappedSettingsSearchUseCase>();
  getIt.unregister<MappedSettingsUseCase>();
  getIt.unregister<SettingsCubit>();
  getIt.unregister<SearchCubit>();
}
