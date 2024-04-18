class CrmBarModel {
  final List<CrmBar> crmBars;

  CrmBarModel({
    required this.crmBars,
  });

  factory CrmBarModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> crmBarsJson = json['data']['children'] ?? [];
    final List<CrmBar> crmBars =
        crmBarsJson.map((crmBarJson) => CrmBar.fromJson(crmBarJson)).toList();

    return CrmBarModel(crmBars: crmBars);
  }
}

class CrmBar {
  final String id;
  final String label;
  final String type;
  final String title;
  final String titleAlignment;
  final String titleColor;
  final String titleSize;
  final String assetUrl;
  final String linkType;
  final String linkTo;
  final String backgroundType;
  final String background;
  final Map<String, dynamic> options;

  CrmBar({
    required this.id,
    required this.label,
    required this.type,
    required this.title,
    required this.titleAlignment,
    required this.titleColor,
    required this.titleSize,
    required this.assetUrl,
    required this.linkType,
    required this.linkTo,
    required this.backgroundType,
    required this.background,
    required this.options,
  });

  factory CrmBar.fromJson(Map<String, dynamic> json) {
    return CrmBar(
      id: json['id'] ?? "",
      label: json['label'] ?? "",
      type: json['type'] ?? "",
      title: json['title'] ?? "",
      titleAlignment: json['title_alignment'] ?? "",
      titleColor: json['title_color'] ?? "",
      titleSize: json['title_size'] ?? "",
      assetUrl: json['asset_url'] ?? "",
      linkType: json['link_type'] ?? "",
      linkTo: json['link_to'] ?? "",
      backgroundType: json['background_type'] ?? "",
      background: json['background'] ?? "",
      options: json['options'] ?? {},
    );
  }
}
