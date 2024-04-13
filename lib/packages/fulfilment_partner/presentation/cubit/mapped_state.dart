import 'package:equatable/equatable.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';

abstract class MappedSettingState extends Equatable {
  const MappedSettingState();

  @override
  List<Object?> get props => [];
}

class MappedSettingsInitialState extends MappedSettingState {}

class MappedSettingsNoDataState extends MappedSettingState {}

class MappedSettingsLoadingState extends MappedSettingState {
  final List<MappedSettingPartners> partners;

  const MappedSettingsLoadingState(this.partners);

  @override
  List<Object?> get props => [partners];
}

class MappedSettingsSuccessState extends MappedSettingState {
  final List<MappedSettingPartners> partners;

  const MappedSettingsSuccessState(this.partners);

  @override
  List<Object?> get props => [partners];
}

class MappedSettingsErrorState extends MappedSettingState {
  final List<MappedSettingPartners> partners;
  final BaseError error;

  const MappedSettingsErrorState(this.partners, this.error);

  @override
  List<Object?> get props => [partners, error];
}

class MappedSettingsSearchState extends MappedSettingState {
  final List<MappedSettingPartners> partners;

  const MappedSettingsSearchState(this.partners);

  @override
  List<Object?> get props => [partners];
}
