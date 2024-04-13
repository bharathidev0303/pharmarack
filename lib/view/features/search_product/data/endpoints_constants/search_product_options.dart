import 'package:json_annotation/json_annotation.dart';

/// This class [SearchProductOptions] is used to contain all Api
/// Query, Path, Post Body parameter related to [search_product] feature.
///
///
///
///
part 'search_product_options.g.dart';

@JsonSerializable()
class OrderByProductRequestParams {
  @JsonKey(name: 'SearchKeyword')
  final String searchKeyword;
  @JsonKey(name: 'StockAndPriority')
  final bool stockAndPriority;
  @JsonKey(name: 'OnlyPriority')
  final bool onlyPriority;
  @JsonKey(name: 'FirstWordExactMatch')
  final bool firstWordExactMatch;
  @JsonKey(name: 'OnlySchemeProduct')
  final bool? onlySchemeProduct;
  @JsonKey(name: 'Molecule')
  final bool molecule;
  @JsonKey(name: 'MoleculeList')
  final String moleculeList;
  @JsonKey(name: 'HighToLow')
  final bool highToLow;
  @JsonKey(name: 'FilteredStoreIds')
  final String filteredStoreIds;
  @JsonKey(name: 'Companies')
  final String companies;
  @JsonKey(name: 'Count')
  final int count;
  @JsonKey(name: 'SkipCount')
  final int skipCount;
  @JsonKey(name: 'CartSource')
  final String cartSource;
  @JsonKey(name: 'filteredCompanyIds')
  final String filteredCompanyIds;

  OrderByProductRequestParams(
      {required this.searchKeyword,
      required this.onlySchemeProduct,
      required this.skipCount,
      required this.stockAndPriority,
      required this.cartSource,
      required this.companies,
      required this.count,
      required this.filteredStoreIds,
      required this.firstWordExactMatch,
      required this.highToLow,
      required this.molecule,
      required this.moleculeList,
      required this.onlyPriority,
      required this.filteredCompanyIds});

  factory OrderByProductRequestParams.fromJson(Map<String, dynamic> json) =>
      _$OrderByProductRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderByProductRequestParamsToJson(this);
}
