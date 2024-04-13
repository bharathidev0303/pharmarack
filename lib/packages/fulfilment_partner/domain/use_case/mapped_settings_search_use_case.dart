import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/request_search_filter_use_case.dart';

class MappedSettingsSearchUseCase extends BaseUseCase<BaseError,
    RequestSearchParams, List<MappedSettingPartners>> {
  final List<MappedSettingPartners> mappedSettingsPartners;

  MappedSettingsSearchUseCase(this.mappedSettingsPartners);

  void updateMappedSettingPartners(
      List<MappedSettingPartners> currentRequests) {
    mappedSettingsPartners.clear();
    mappedSettingsPartners.addAll(currentRequests);
  }

  (int, List<MappedSettingPartners>) updateSettingsSelectionState(int id) {
    final previousSelectedIndex =
        mappedSettingsPartners.indexWhere((element) => element.isSelected);
    mappedSettingsPartners[previousSelectedIndex] =
        mappedSettingsPartners[previousSelectedIndex].copyWith(
            isSelected:
                !mappedSettingsPartners[previousSelectedIndex].isSelected);

    int index = mappedSettingsPartners
        .indexWhere((element) => (element.fulfillmentPartnerId ?? 0) == id);
    if (index != -1) {
      mappedSettingsPartners[index] =
          mappedSettingsPartners[index].copyWith(isSelected: true);
    }
    return (index, List.of(mappedSettingsPartners));
  }

  (List<MappedSettingPartners>, int) updateViewOrderCheckedState(int id) {
    int index = mappedSettingsPartners
        .indexWhere((element) => element.fulfillmentPartnerId == id);

    if (index != -1) {
      mappedSettingsPartners[index] = mappedSettingsPartners[index].copyWith(
        isShowViewOrder:
            !(mappedSettingsPartners[index].isShowViewOrder ?? false),
      );
    }

    return (List.of(mappedSettingsPartners), index);
  }

  (List<MappedSettingPartners>, int) updatePlacedOrderCheckedState(int id) {
    int index = mappedSettingsPartners
        .indexWhere((element) => element.fulfillmentPartnerId == id);

    if (index != -1) {
      mappedSettingsPartners[index] = mappedSettingsPartners[index].copyWith(
        isShowPlaceOrder:
            !(mappedSettingsPartners[index].isShowPlaceOrder ?? false),
      );
    }

    return (List.of(mappedSettingsPartners), index);
  }

  @override
  Future<Either<BaseError, List<MappedSettingPartners>>> execute(
      {required RequestSearchParams params}) {
    final searchString = params.requestSearchParam.searchQuery;
    final searchResult = _searchBasedOnParam(searchString);
    return Future.value(right(searchResult));
  }

  List<MappedSettingPartners> _searchBasedOnParam(String searchString) {
    return searchString.isEmpty
        ? mappedSettingsPartners
        : mappedSettingsPartners
            .where((element) =>
                (element.mobileNumber
                        ?.toLowerCase()
                        .contains(searchString.toLowerCase()) ??
                    false) ||
                (element.fulfillmentPartnerName
                        ?.toLowerCase()
                        .contains(searchString.toLowerCase()) ??
                    false))
            .toList();
  }
}
