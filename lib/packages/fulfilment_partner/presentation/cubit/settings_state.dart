import 'package:equatable/equatable.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/custom_dropdown/custom_drop_down.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsInitialState extends SettingsState {}

class SettingsLoadingState extends SettingsState {
  final List<MappedSettingPartners> partners;
  final MappedSettingPartners? mappedSettingPartners;

  SettingsLoadingState(this.partners, {this.mappedSettingPartners});

  @override
  List<Object?> get props => [partners, mappedSettingPartners];
}

class SettingsNoDataState extends SettingsState {
  final List<MappedSettingPartners> partners;
  final MappedSettingPartners? mappedSettingPartners;

  SettingsNoDataState(this.partners, {this.mappedSettingPartners});

  @override
  List<Object?> get props => [partners, mappedSettingPartners];
}

class SettingsErrorState extends SettingsState {
  final List<MappedSettingPartners> partners;
  final MappedSettingPartners? mappedSettingPartners;
  final BaseError error;

  SettingsErrorState(this.partners, this.error, {this.mappedSettingPartners});

  @override
  List<Object?> get props => [partners, mappedSettingPartners, error];
}

/// Setting pages states
class SettingsSuccessState extends SettingsState {
  final List<MappedSettingPartners> partners;
  final SearchResult searchResult;
  final MappedSettingPartners? mappedSettingPartners;
  final bool isLoadingDone;
  final String saveSettingSuccessMessage;

  SettingsSuccessState(
      this.partners, this.searchResult, this.mappedSettingPartners,
      {this.isLoadingDone = false, this.saveSettingSuccessMessage = ""});

  @override
  List<Object?> get props => [
        partners,
        searchResult,
        mappedSettingPartners,
        isLoadingDone,
        saveSettingSuccessMessage
      ];
}
