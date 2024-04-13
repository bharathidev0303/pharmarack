class CrmBarWidgetModel {
  final String title;
  final String titleAlignment;
  final String titleColor;
  final String subTitleColor;
  final String titleSize;
  final String subTitleSize;
  final String backgroundType;
  final String background;
  final List<CrmBar> crmBars;
  CrmBarWidgetModel({
    required this.title,
    required this.titleAlignment,
    required this.titleColor,
    required this.subTitleColor,
    required this.titleSize,
    required this.subTitleSize,
    required this.backgroundType,
    required this.background,
    required this.crmBars,
  });

  factory CrmBarWidgetModel.fromJson(Map<String, dynamic> json) {
    final String title = json['title'] ?? "";
    final String titleAlignment = json['title_alignment'] ?? "";
    final String titleColor = json['title_color'] ?? "";
    final String subTitleColor = json['sub_title_color'] ?? "";
    final String titleSize = json['title_size'] ?? "";
    final String subTitleSize = json['sub_title_size'] ?? "";
    final String backgroundType = json['background_type'] ?? "";
    final String background = json['background'] ?? "";
    final List<dynamic> crmBarsJson = json['childrens'] ?? [];
    final List<CrmBar> crmBars =
        crmBarsJson.map((crmBarJson) => CrmBar.fromJson(crmBarJson)).toList();

    return CrmBarWidgetModel(
        title: title,
        titleAlignment: titleAlignment,
        titleColor: titleColor,
        subTitleColor: subTitleColor,
        titleSize: titleSize,
        subTitleSize: subTitleSize,
        backgroundType: backgroundType,
        background: background,
        crmBars: crmBars);
  }
}

class CrmBar {
  final String label;
  final String title;
  final String titleAlignment;
  final String titleColor;
  final String titleSize;
  final String assetUrl;
  final String linkType;
  final String linkTo;
  final String linkToExtra;
  final String backgroundType;
  final String background;

  CrmBar({
    required this.label,
    required this.title,
    required this.titleAlignment,
    required this.titleColor,
    required this.titleSize,
    required this.assetUrl,
    required this.linkType,
    required this.linkTo,
    required this.linkToExtra,
    required this.backgroundType,
    required this.background,
  });

  factory CrmBar.fromJson(Map<String, dynamic> json) {
    return CrmBar(
      label: json['label'] ?? "",
      title: json['title'] ?? "",
      titleAlignment: json['title_alignment'] ?? "",
      titleColor: json['title_color'] ?? "",
      titleSize: json['title_size'] ?? "",
      assetUrl: json['asset_url'] ?? "",
      linkType: json['link_type'] ?? "",
      linkTo: json['link_to'] ?? "",
      linkToExtra: json['link_to_extra'] ?? "",
      backgroundType: json['background_type'] ?? "",
      background: json['background'] ?? "",
    );
  }
}
