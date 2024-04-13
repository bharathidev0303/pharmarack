class VideoWidgetModel {
  final String assetUrl;
  final String titleAlignment;
  final String titleColor;
  final String subTitleColor;
  final String titleSize;
  final String subTitleSize;
  final String title;
  final String componentType;

  VideoWidgetModel({
    required this.assetUrl,
    required this.titleAlignment,
    required this.titleColor,
    required this.subTitleColor,
    required this.titleSize,
    required this.subTitleSize,
    required this.title,
    required this.componentType,
  });

  factory VideoWidgetModel.fromJson(Map<String, dynamic> json) {
    final String assetUrl = json['asset_url'] ?? "";
    final String titleAlignment = json['title_alignment'] ?? "";
    final String titleColor = json['title_color'] ?? "";
    final String subTitleColor = json['sub_title_color'] ?? false;
    final String titleSize = json['title_size'] ?? "";
    final String subTitleSize = json['sub_title_size'] ?? "";
    final String title = json['title'] ?? "";
    final String componentType = json['component_type'] ?? "";

    return VideoWidgetModel(
      assetUrl: assetUrl,
      titleAlignment: titleAlignment,
      titleColor: titleColor,
      subTitleColor: subTitleColor,
      titleSize: titleSize,
      subTitleSize: subTitleSize,
      title: title,
      componentType: componentType,
    );
  }
}
