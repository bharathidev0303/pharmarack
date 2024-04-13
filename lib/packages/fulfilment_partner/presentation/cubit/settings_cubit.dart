import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_param.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/mapped_settings_search_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/mapped_settings_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/saved_mapped_settings_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/settings_state.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/custom_dropdown/custom_drop_down.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final MappedSettingsUseCase _mappedSettingsUseCase;
  final MappedSettingsSearchUseCase _mappedSettingsSearchUseCase;
  final SavedMappedSettingsUseCase _savedMappedSettingsUseCase;
  final SearchCubit _searchCubit;

  SettingsCubit(
      MappedSettingsUseCase mappedSettingsUseCase,
      MappedSettingsSearchUseCase mappedSettingsSearchUseCase,
      SavedMappedSettingsUseCase savedMappedSettingsUseCase,
      SearchCubit searchCubit)
      : _mappedSettingsUseCase = mappedSettingsUseCase,
        _mappedSettingsSearchUseCase = mappedSettingsSearchUseCase,
        _savedMappedSettingsUseCase = savedMappedSettingsUseCase,
        _searchCubit = searchCubit,
        super(SettingsInitialState());

  void getMappedSettingsFromSettingsPage(String value) async {
    await Future.delayed(const Duration(milliseconds: 300));
    emit(await Future.value(SettingsLoadingState(
        _mappedSettingsSearchUseCase.mappedSettingsPartners)));

    final response =
        await _mappedSettingsUseCase.execute(params: MappedSettingsParams());

    response.fold((l) async {
      emit(
        SettingsErrorState(
            _mappedSettingsSearchUseCase.mappedSettingsPartners, l),
      );
    }, (r) {
      if (r.mappedPartnerList == null ||
          (r.mappedPartnerList?.isEmpty ?? true)) {
        emit(SettingsNoDataState(
            _mappedSettingsSearchUseCase.mappedSettingsPartners));
        return;
      }
      final result = List.of([
        MappedSettingPartners().copyWith(
          fulfillmentPartnerName: value,
          isSelected: true,
          fulfillmentPartnerId: r.hashCode,
        ),
        ...r.mappedPartnerList!
      ]);
      _mappedSettingsSearchUseCase.updateMappedSettingPartners(result);
      emit(
        SettingsSuccessState(
          result,
          const SearchResult(searchQuery: ""),
          null,
          isLoadingDone: true,
        ),
      );
    });
  }

  void selectSearchSettings(int id, String value) {
    final result =
        _mappedSettingsSearchUseCase.updateSettingsSelectionState(id);

    if (result.$1 != -1) {
      emit(SettingsSuccessState(
        result.$2,
        SearchResult(
            searchQuery: _searchCubit.state, shouldUpdateResults: true),
        result.$2[result.$1].fulfillmentPartnerName == value
            ? null
            : result.$2[result.$1],
      ));
    } else {
      int index = result.$2
          .indexWhere((element) => element.fulfillmentPartnerName == value);
      if (index != -1) {
        result.$2[index] = result.$2[index].copyWith(isSelected: true);
      }

      emit(
        SettingsSuccessState(
          result.$2,
          SearchResult(
              searchQuery: _searchCubit.state, shouldUpdateResults: true),
          null,
        ),
      );
    }
  }

  void checkedAndUncheckedOrder(int id, bool shouldUpdateViewOrder) {
    final result = shouldUpdateViewOrder
        ? _mappedSettingsSearchUseCase.updateViewOrderCheckedState(id)
        : _mappedSettingsSearchUseCase.updatePlacedOrderCheckedState(id);

    emit(SettingsSuccessState(
      result.$1,
      const SearchResult(searchQuery: "", shouldUpdateResults: true),
      result.$1[result.$2],
    ));
  }

  void savedMappedSettingsUseCase(
      MappedSettingPartners mappedSettingPartner) async {
    // Encode the JSON array as a string.
    String encodedDataForController = jsonEncode([
      {
        FulfilmentPartnerOptions.fulfillmentPartnerId:
            '${mappedSettingPartner.fulfillmentPartnerId}',
        FulfilmentPartnerOptions.isShowViewOrder:
            '${mappedSettingPartner.isShowViewOrder}',
        FulfilmentPartnerOptions.isShowPlaceOrder:
            '${mappedSettingPartner.isShowPlaceOrder}'
      }
    ]);

    emit(
      SettingsLoadingState(
        _mappedSettingsSearchUseCase.mappedSettingsPartners,
        mappedSettingPartners: mappedSettingPartner,
      ),
    );

    final response = await _savedMappedSettingsUseCase.execute(
      params: SavedMappedSettingsParams(
        SaveMappedSettingsParam(encodedDataForController),
      ),
    );

    response.fold((l) {
      emit(
        SettingsErrorState(
          _mappedSettingsSearchUseCase.mappedSettingsPartners,
          l,
          mappedSettingPartners: mappedSettingPartner,
        ),
      );
    }, (r) {
      emit(
        SettingsSuccessState(
          _mappedSettingsSearchUseCase.mappedSettingsPartners,
          const SearchResult(searchQuery: "", shouldUpdateResults: true),
          mappedSettingPartner,
          saveSettingSuccessMessage: r,
          isLoadingDone: true,
        ),
      );
    });
  }
}
