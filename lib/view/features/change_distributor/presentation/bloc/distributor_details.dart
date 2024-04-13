class DistributorDetails {
  final int id;
  final String name;
  final double? ptr;
  final double? hiddenPtr;
  final double? gstPercentage;
  final double? mrp;
  final int? stockQuantity;
  final String? scheme;
  final int? freeQuantity;

  DistributorDetails({
    required this.id,
    required this.name,
    this.ptr,
    this.mrp,
    this.hiddenPtr,
    this.gstPercentage,
    this.stockQuantity,
    this.scheme,
    this.freeQuantity,
  });
}
