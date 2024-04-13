class ImageWidgetModel {
  final String mobileAssetUrl;
  final String webAssetUrl;
  final String linkType;
  final String linkTo;
  final String linkToExtra;
  final String titleAlignment;
  final String titleColor;
  final String subTitleColor;
  final String titleSize;
  final String subTitleSize;
  final String title;
  final String componentType;

  ImageWidgetModel({
    required this.mobileAssetUrl,
    required this.webAssetUrl,
    required this.linkType,
    required this.linkTo,
    required this.linkToExtra,
    required this.titleAlignment,
    required this.titleColor,
    required this.subTitleColor,
    required this.titleSize,
    required this.subTitleSize,
    required this.title,
    required this.componentType,
  });

  factory ImageWidgetModel.fromJson(Map<String, dynamic> json) {
    final String mobileAssetUrl = json['mobile_asset_url'] ?? "";
    final String webAssetUrl = json['web_asset_url'] ?? "";
    final String linkType = json['link_type'] ?? "";
    final String linkTo = json['link_to'] ?? "";
    final String linkToExtra = json['link_to_extra'] ?? "";
    final String titleAlignment = json['title_alignment'] ?? "";
    final String titleColor = json['title_color'] ?? "";
    final String subTitleColor = json['sub_title_color'] ?? false;
    final String titleSize = json['title_size'] ?? "";
    final String subTitleSize = json['sub_title_size'] ?? "";
    final String title = json['title'] ?? "";
    final String componentType = json['component_type'] ?? "";

    return ImageWidgetModel(
      mobileAssetUrl: mobileAssetUrl,
      webAssetUrl: webAssetUrl,
      linkType: linkType,
      linkTo: linkTo,
      linkToExtra: linkToExtra,
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
