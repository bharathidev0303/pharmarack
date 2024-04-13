// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderByProductRequestParams _$OrderByProductRequestParamsFromJson(
        Map<String, dynamic> json) =>
    OrderByProductRequestParams(
      searchKeyword: json['SearchKeyword'] as String,
      onlySchemeProduct: json['OnlySchemeProduct'] as bool?,
      skipCount: json['SkipCount'] as int,
      stockAndPriority: json['StockAndPriority'] as bool,
      cartSource: json['CartSource'] as String,
      companies: json['Companies'] as String,
      count: json['Count'] as int,
      filteredStoreIds: json['FilteredStoreIds'] as String,
      firstWordExactMatch: json['FirstWordExactMatch'] as bool,
      highToLow: json['HighToLow'] as bool,
      molecule: json['Molecule'] as bool,
      moleculeList: json['MoleculeList'] as String,
      onlyPriority: json['OnlyPriority'] as bool,
      filteredCompanyIds: json['filteredCompanyIds'] as String,
    );

Map<String, dynamic> _$OrderByProductRequestParamsToJson(
        OrderByProductRequestParams instance) =>
    <String, dynamic>{
      'SearchKeyword': instance.searchKeyword,
      'StockAndPriority': instance.stockAndPriority,
      'OnlyPriority': instance.onlyPriority,
      'FirstWordExactMatch': instance.firstWordExactMatch,
      'OnlySchemeProduct': instance.onlySchemeProduct,
      'Molecule': instance.molecule,
      'MoleculeList': instance.moleculeList,
      'HighToLow': instance.highToLow,
      'FilteredStoreIds': instance.filteredStoreIds,
      'Companies': instance.companies,
      'Count': instance.count,
      'SkipCount': instance.skipCount,
      'CartSource': instance.cartSource,
      'filteredCompanyIds': instance.filteredCompanyIds,
    };
