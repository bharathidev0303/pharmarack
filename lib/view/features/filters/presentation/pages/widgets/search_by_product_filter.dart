import 'package:pharmarack/view/features/filters/domain/model/filters/filter_type.dart';

class SearchByProductFilter {
  String? filterName;
  int? value;
  FilterType? requestKey;
  FilterType? groupKey;
  bool isCompanyChecked;
  int companyRequestKey;
  bool selectedRadioValue;

  SearchByProductFilter(
      {this.filterName,
      this.value,
      this.requestKey,
      this.groupKey,
      this.isCompanyChecked = false,
      this.companyRequestKey = -1,
      this.selectedRadioValue = false});

  SearchByProductFilter copyWith(
      {String? filterName,
      int? value,
      FilterType? requestKey,
      FilterType? groupKey,
      bool? isCompanyChecked,
      int? companyRequestKey,
      bool? selectedRadioValue}) {
    return SearchByProductFilter(
        filterName: filterName ?? this.filterName,
        value: value ?? this.value,
        requestKey: requestKey ?? this.requestKey,
        groupKey: groupKey ?? this.groupKey,
        isCompanyChecked: isCompanyChecked ?? this.isCompanyChecked,
        companyRequestKey: companyRequestKey ?? this.companyRequestKey,
        selectedRadioValue: selectedRadioValue ?? this.selectedRadioValue);
  }
}
