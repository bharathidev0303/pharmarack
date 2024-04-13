class CardWidgetModel {
  final String title;
  final String type;
  final String titleAlignment;
  final String titleColor;
  final String titleSize;
  final String subTitle;
  final String subTitleColor;
  final String subTitleSize;
  final bool showViewMoreBtn;
  final String viewMoreBtnLabel;
  final String linkType;
  final String viewMoreLinkTo;
  final String viewMoreLinkToExtra;
  final String backgroundType;
  final String background;
  final String itemsVisibleMobile;
  final String itemsVisibleTablet;
  final String itemsVisibleWeb;
  final List<CardItem> children;

  CardWidgetModel({
    required this.title,
    required this.type,
    required this.titleAlignment,
    required this.titleColor,
    required this.titleSize,
    required this.subTitle,
    required this.subTitleColor,
    required this.subTitleSize,
    required this.showViewMoreBtn,
    required this.viewMoreBtnLabel,
    required this.linkType,
    required this.viewMoreLinkTo,
    required this.viewMoreLinkToExtra,
    required this.backgroundType,
    required this.background,
    required this.children,
    required this.itemsVisibleMobile,
    required this.itemsVisibleTablet,
    required this.itemsVisibleWeb,
  });

  factory CardWidgetModel.fromJson(Map<String, dynamic> json) {
    final String type = json['type'] ?? "";
    final String title = json['title'] ?? "";
    final String titleSize = json['title_size'] ?? "";
    final String titleColor = json['title_color'] ?? "";
    final String titleAlignment = json['title_alignment'] ?? "";
    final String subTitle = json['sub_title'] ?? "";
    final String subTitleColor = json['sub_title_color'] ?? "";
    final String subTitleSize = json['sub_title_size'] ?? "";
    final bool showViewMoreBtn = json['show_view_more_btn'] ?? false;
    final String viewMoreBtnLabel = json['view_more_btn_label'] ?? "";
    final String linkType = json['link_type'] ?? "";
    final String viewMoreLinkTo = json['view_more_link_to'] ?? "";
    final String viewMoreLinkToExtra = json['view_more_link_to_extra'] ?? "";
    final String backgroundType = json['background_type'] ?? "";
    final String background = json['background'] ?? "";
    final String itemsVisibleMobile =
        json['items_visible_on_mobile'].toString() ?? "";
    final String itemsVisibleTablet =
        json['items_visible_on_tablet'].toString() ?? "";
    final String itemsVisibleWeb =
        json['items_visible_on_web'].toString() ?? "";

    final List<dynamic> cardJson = json['childrens'] ?? [];
    final List<CardItem> cardChildren =
        cardJson.map((cardJson) => CardItem.fromJson(cardJson)).toList();

    return CardWidgetModel(
      title: title,
      type: type,
      titleAlignment: titleAlignment,
      titleColor: titleColor,
      titleSize: titleSize,
      subTitle: subTitle,
      subTitleColor: subTitleColor,
      subTitleSize: subTitleSize,
      showViewMoreBtn: showViewMoreBtn,
      viewMoreBtnLabel: viewMoreBtnLabel,
      linkType: linkType,
      viewMoreLinkTo: viewMoreLinkTo,
      viewMoreLinkToExtra: viewMoreLinkToExtra,
      backgroundType: backgroundType,
      background: background,
      itemsVisibleMobile: itemsVisibleMobile,
      itemsVisibleTablet: itemsVisibleTablet,
      itemsVisibleWeb: itemsVisibleWeb,
      children: cardChildren,
    );
  }
}

class CardItem {
  final String title;
  final String subTitle;
  final String assetUrl;
  final String linkType;
  final String linkTo;
  final String linkToExtra;
  final String titleColor;
  final String titleSize;
  final String backgroundType;
  final String background;

  CardItem({
    required this.title,
    required this.subTitle,
    required this.assetUrl,
    required this.linkType,
    required this.linkTo,
    required this.linkToExtra,
    required this.titleColor,
    required this.titleSize,
    required this.backgroundType,
    required this.background,
  });

  factory CardItem.fromJson(Map<String, dynamic> children) {
    return CardItem(
      title: children['title'] ?? "",
      subTitle: children['sub_title'] ?? "",
      assetUrl: children['asset_url'] ?? "",
      linkType: children['link_type'] ?? "",
      titleColor: children['title_color'] ?? "",
      titleSize: children['title_size'] ?? "",
      backgroundType: children['background_type'] ?? "",
      background: children['background'] ?? "",
      linkTo: children['link_to'] ?? "",
      linkToExtra: children['link_to_extra'] ?? "",
    );
  }
}
