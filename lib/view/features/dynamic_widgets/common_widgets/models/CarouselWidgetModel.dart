class CarouselWidgetModel {
  final String title;
  final String subTitle;
  final bool showTitle;
  final String titleAlignment;
  final String titleColor;
  final String subTitleColor;
  final String titleSize;
  final String backgroundType;
  final String background;
  final bool autoStart;
  final String duration;
  final bool repeat;
  final bool showViewMoreBtn;
  final String viewMoreBtnLabel;
  final String linkType;
  final String viewMoreLinkTo;
  final String? viewMoreLinkToExtra;
  final String itemsVisibleMobile;
  final String itemsVisibleTablet;
  final String itemsVisibleWeb;
  final List<Carousel> carousel;

  CarouselWidgetModel({
    required this.title,
    required this.subTitle,
    required this.showTitle,
    required this.titleAlignment,
    required this.titleColor,
    required this.subTitleColor,
    required this.titleSize,
    required this.backgroundType,
    required this.background,
    required this.autoStart,
    required this.duration,
    required this.repeat,
    required this.showViewMoreBtn,
    required this.viewMoreBtnLabel,
    required this.linkType,
    required this.viewMoreLinkTo,
    required this.viewMoreLinkToExtra,
    required this.itemsVisibleMobile,
    required this.itemsVisibleTablet,
    required this.itemsVisibleWeb,
    required this.carousel,
  });

  factory CarouselWidgetModel.fromJson(Map<String, dynamic> json) {
    final String title = json['title'] ?? "";
    final String subTitle = json['sub_title'] ?? "";
    final bool showTitle = json['show_title'] ?? false;
    final bool showViewMoreBtn = json['show_view_more_btn'] ?? false;
    final String viewMoreBtnLabel = json['view_more_btn_label'] ?? "";
    final String linkType = json['link_type'] ?? "";
    final String viewMoreLinkTo = json['view_more_link_to'] ?? "";
    final String? viewMoreLinkToExtra = json['view_more_link_to_extra'] ?? "";
    final String titleAlignment = json['title_alignment'] ?? "";
    final String titleColor = json['title_color'] ?? "";
    final String subTitleColor = json['sub_title_color'] ?? "";
    final String titleSize = json['title_size'] ?? "";
    final String backgroundType = json['background_type'] ?? "";
    final String background = json['background'] ?? "";
    final bool autoStart = json['auto_start'] ?? false;
    final String duration = json['duration'].toString() ?? "";
    final bool repeat = json['repeat'] ?? false;
    final String itemsVisibleMobile =
        json['items_visible_on_mobile'].toString() ?? "";
    final String itemsVisibleTablet =
        json['items_visible_on_tablet'].toString() ?? "";
    final String itemsVisibleWeb =
        json['items_visible_on_web'].toString() ?? "";
    final List<dynamic> carouselJson = json['childrens'] ?? [];
    final List<Carousel> carousel = carouselJson
        .map((carouselJson) => Carousel.fromJson(carouselJson))
        .toList();

    return CarouselWidgetModel(
        title: title,
        subTitle: subTitle,
        showTitle: showTitle,
        titleAlignment: titleAlignment,
        titleColor: titleColor,
        subTitleColor: subTitleColor,
        titleSize: titleSize,
        backgroundType: backgroundType,
        background: background,
        autoStart: autoStart,
        duration: duration,
        repeat: repeat,
        showViewMoreBtn: showViewMoreBtn,
        viewMoreBtnLabel: viewMoreBtnLabel,
        linkType: linkType,
        viewMoreLinkTo: viewMoreLinkTo,
        itemsVisibleMobile: itemsVisibleMobile,
        itemsVisibleTablet: itemsVisibleTablet,
        itemsVisibleWeb: itemsVisibleWeb,
        viewMoreLinkToExtra: viewMoreLinkToExtra,
        carousel: carousel);
  }
}

class Carousel {
  final String title;
  final String assetType;
  final String linkType;
  final String linkTo;
  final String linkToExtra;
  final String duration;
  final String mobileAssetUrl;
  final String webAssetUrl;
  Carousel({
    required this.title,
    required this.assetType,
    required this.linkType,
    required this.linkTo,
    required this.linkToExtra,
    required this.duration,
    required this.mobileAssetUrl,
    required this.webAssetUrl,
  });

  factory Carousel.fromJson(Map<String, dynamic> children) {
    return Carousel(
      title: children['title'] ?? "",
      assetType: children['asset_type'] ?? "",
      linkType: children['link_type'] ?? "",
      linkTo: children['link_to'] ?? "",
      linkToExtra: children['link_to_extra'] ?? "",
      duration: children['duration'].toString() ?? "",
      mobileAssetUrl: children['mobile_asset_url'] ?? "",
      webAssetUrl: children['web_asset_url'] ?? "",
    );
  }
}
