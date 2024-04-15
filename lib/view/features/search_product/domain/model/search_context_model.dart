class SearchContextModel {
  final String contextType;
  final String? searchText;
  final String? title;
  final int? storeId;
  final String? storeName;
  final int? companyId;
  final String? companyName;

  SearchContextModel(
      {required this.contextType,
      this.title,
      this.searchText,
      this.storeId,
      this.storeName,
      this.companyId,
      this.companyName});

  SearchContextModel copyWith({
    required String contextType,
    String? searchText,
    String? title,
    int? storeId,
    String? storeName,
    int? companyId,
    String? companyName,
  }) {
    return SearchContextModel(
      contextType: contextType,
      searchText: searchText ?? this.searchText,
      title: title ?? this.title,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
    );
  }
}
