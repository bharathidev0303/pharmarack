//TopWidgetModel
class TopWidgetModel {
  final String? type;
  final String? context;
  final String? itemsToShow;
  final bool? showViewMoreBtn;
  final bool? showAddDistributorsBtn;
  final String? viewMoreBtnLabel;
  final String? linkType;
  final String? viewMoreLinkTo;
  final String? viewMoreLinkToExtra;
  final String? titleAlignment;
  final String? titleColor;
  final String? subTitleColor;
  final String? titleSize;
  final String? subTitleSize;
  final String? backgroundType;
  final String? background;
  final String? title;
  final String? subTitle;
  final String? itemsVisibleMobile;
  final String? itemsVisibleTablet;
  final String? itemsVisibleWeb;
  final String? componentType;
  final List<dynamic> data;

  TopWidgetModel({
    this.type,
    this.context,
    this.itemsToShow,
    this.showViewMoreBtn,
    this.showAddDistributorsBtn,
    this.viewMoreBtnLabel,
    this.linkType,
    this.viewMoreLinkTo,
    this.viewMoreLinkToExtra,
    this.titleAlignment,
    this.titleColor,
    this.subTitleColor,
    this.titleSize,
    this.subTitleSize,
    this.backgroundType,
    this.background,
    this.title,
    this.subTitle,
    this.componentType,
    this.itemsVisibleMobile,
    this.itemsVisibleTablet,
    this.itemsVisibleWeb,
    required this.data,
  });

  factory TopWidgetModel.fromJson(Map<String, dynamic> json) {
    final String? type = json['type'] ?? "";
    final String? context = json['context'] ?? "";
    final String itemsToShow = (json['items_to_show'] ?? "").toString();
    final bool? showViewMoreBtn = json['show_view_more_btn'] ?? false;
    final bool? showAddDistributorsBtn =
        json['show_add_distributors_btn'] ?? false;
    final String? viewMoreBtnLabel = json['view_more_btn_label'] ?? "";
    final String? linkType = json['link_type'] ?? "";
    final String? viewMoreLinkTo = json['view_more_link_to'] ?? "";
    final String? viewMoreLinkToExtra = json['view_more_link_to_extra'] ?? "";
    final String? titleAlignment = json['title_alignment'] ?? "";
    final String? titleColor = json['title_color'] ?? "";
    final String? subTitleColor = json['sub_title_color'] ?? "";
    final String? titleSize = json['title_size'] ?? "";
    final String? subTitleSize = json['sub_title_size'] ?? "";
    final String? backgroundType = json['background_type'] ?? "";
    final String? background = json['background'] ?? "";
    final String itemsVisibleMobile =
        json['items_visible_on_mobile'].toString() ?? "";
    final String itemsVisibleTablet =
        json['items_visible_on_tablet'].toString() ?? "";
    final String itemsVisibleWeb =
        json['items_visible_on_web'].toString() ?? "";
    final String? title = json['title'] ?? "";
    final String? subTitle = json['sub_title'] ?? "";
    final String? componentType = json['component_type'] ?? "";
    final List<dynamic> data = json['data'] ?? [];
    return TopWidgetModel(
      type: type,
      context: context,
      itemsToShow: itemsToShow,
      showViewMoreBtn: showViewMoreBtn,
      showAddDistributorsBtn: showAddDistributorsBtn,
      viewMoreBtnLabel: viewMoreBtnLabel,
      linkType: linkType,
      viewMoreLinkTo: viewMoreLinkTo,
      viewMoreLinkToExtra: viewMoreLinkToExtra,
      titleAlignment: titleAlignment,
      titleColor: titleColor,
      subTitleColor: subTitleColor,
      titleSize: titleSize,
      subTitleSize: subTitleSize,
      backgroundType: backgroundType,
      background: background,
      title: title,
      subTitle: subTitle,
      itemsVisibleMobile: itemsVisibleMobile,
      itemsVisibleTablet: itemsVisibleTablet,
      itemsVisibleWeb: itemsVisibleWeb,
      componentType: componentType,
      data: data,
    );
  }
}
