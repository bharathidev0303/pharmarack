class AddProductToCartParams {
  final int storeId;
  final int quantity;
  final String productCode;
  final double ptr;
  final double hiddenPTR;
  final double gSTPercentage;
  final String cartSource;
  final int isDODProductCheck;
  final int isDODPreferenceSet;
  final int isDODProductSelected;

  AddProductToCartParams({
    required this.storeId,
    required this.quantity,
    required this.productCode,
    required this.ptr,
    required this.hiddenPTR,
    required this.gSTPercentage,
    required this.cartSource,
    required this.isDODProductCheck,
    required this.isDODPreferenceSet,
    required this.isDODProductSelected,
  });
}
