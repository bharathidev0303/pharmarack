//TopDistributorsModel
class TopDistributorsModel {
  final String type;
  final String context;
  final String label;
  final String itemsToShow;
  final bool showViewMoreBtn;
  final String viewMoreBtnLabel;
  final String linkType;
  final String viewMoreLinkTo;
  final String title;
  final String titleAlignment;
  final String titleColor;
  final String titleSize;
  final String backgroundType;
  final String background;
  final List<DistributorsData> distributors;

  TopDistributorsModel({
    required this.type,
    required this.context,
    required this.label,
    required this.itemsToShow,
    required this.showViewMoreBtn,
    required this.viewMoreBtnLabel,
    required this.linkType,
    required this.viewMoreLinkTo,
    required this.title,
    required this.titleAlignment,
    required this.titleColor,
    required this.titleSize,
    required this.backgroundType,
    required this.background,
    required this.distributors,
  });

  factory TopDistributorsModel.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> children) {
    final String type = json['type'] ?? "";
    final String context = json['context'] ?? "";
    final String label = json['label'] ?? "";
    final String itemsToShow = json['items_to_show'] ?? "";
    final bool showViewMoreBtn = json['show_view_more_btn'] ?? false;
    final String viewMoreBtnLabel = json['view_more_btn_label'] ?? "";
    final String linkType = json['link_type'] ?? "";
    final String viewMoreLinkTo = json['view_more_link_to'] ?? "";
    final String title = json['title'] ?? "";
    final String titleAlignment = json['title_alignment'] ?? "";
    final String titleColor = json['title_color'] ?? "";
    final String titleSize = json['title_size'] ?? "";
    final String backgroundType = json['background_type'] ?? "";
    final String background = json['background'] ?? "";

    print(children);
    final List<dynamic> distributorsJson = children['distributors'] ?? [];
    final List<DistributorsData> distributors = distributorsJson
        .map((distributorsJson) => DistributorsData.fromJson(distributorsJson))
        .toList();

    return TopDistributorsModel(
        type: type,
        context: context,
        label: label,
        itemsToShow: itemsToShow,
        showViewMoreBtn: showViewMoreBtn,
        viewMoreBtnLabel: viewMoreBtnLabel,
        linkType: linkType,
        viewMoreLinkTo: viewMoreLinkTo,
        title: title,
        titleAlignment: titleAlignment,
        titleColor: titleColor,
        titleSize: titleSize,
        backgroundType: backgroundType,
        background: background,
        distributors: distributors);
  }
}

class DistributorsData {
  final int id;
  final String storeName;
  final String company;
  final String area;
  final String location;

  DistributorsData({
    required this.id,
    required this.storeName,
    required this.company,
    required this.area,
    required this.location,
  });

  factory DistributorsData.fromJson(Map<String, dynamic> json) {
    return DistributorsData(
      id: json['id'] ?? "",
      storeName: json['storeName'] ?? "",
      company: json['company'] ?? "",
      area: json['area'] ?? "",
      location: json['location'] ?? "",
    );
  }
}
