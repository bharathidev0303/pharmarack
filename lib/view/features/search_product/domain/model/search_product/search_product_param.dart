class OrderByProductParams {
  final String searchKeyword;
  final bool stockAndPriority;
  final bool onlyPriority;
  final bool firstWordExactMatch;
  final bool? onlySchemeProduct;
  final bool molecule;
  final String moleculeList;
  final bool highToLow;
  final String filteredStoreIds;
  final String companies;
  final int count;
  final int skipCount;
  final String cartSource;
  final String filteredCompanyIds;

  OrderByProductParams(
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
}
