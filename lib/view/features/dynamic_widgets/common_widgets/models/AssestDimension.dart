class AssestDimension {
  final double width;
  final double height;

  AssestDimension({required this.width, required this.height});

  factory AssestDimension.fromJson(Map<String, dynamic> children) {
    return AssestDimension(
      width: double.parse(children['width'].toString()),
      height: double.parse(children['height'].toString()),
    );
  }

  factory AssestDimension.empty() {
    return AssestDimension(
      width: 0.0,
      height: 0.0,
    );
  }
}
