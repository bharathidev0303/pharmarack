class RewordsWidgetModel {
  final String rewardType;
  final int flyCampId;
  final String titleAlignment;
  final String titleColor;
  final String subTitleColor;
  final String titleSize;
  final String subTitleSize;
  final String backgroundType;
  final String background;
  final String title;
  final String subTitle;
  final String componentType;

  RewordsWidgetModel({
    required this.rewardType,
    required this.flyCampId,
    required this.titleAlignment,
    required this.titleColor,
    required this.subTitleColor,
    required this.titleSize,
    required this.subTitleSize,
    required this.backgroundType,
    required this.background,
    required this.title,
    required this.subTitle,
    required this.componentType,
  });

  factory RewordsWidgetModel.fromJson(Map<String, dynamic> json) {
    final String rewardType = json['reward_type'] ?? "";
    final int flyCampId = json['flyy_camp_id'] ?? 0;
    final String titleAlignment = json['title_alignment'] ?? "";
    final String titleColor = json['title_color'] ?? "";
    final String subTitleColor = json['sub_title_color'] ?? "";
    final String titleSize = json['title_size'] ?? "";
    final String subTitleSize = json['sub_title_size'] ?? "";
    final String backgroundType = json['background_type'] ?? "";
    final String background = json['background'] ?? "";
    final String title = json['title'] ?? "";
    final String subTitle = json['sub_title'] ?? "";
    final String componentType = json['component_type'] ?? "";

    return RewordsWidgetModel(
      rewardType: rewardType,
      flyCampId: flyCampId,
      titleAlignment: titleAlignment,
      titleColor: titleColor,
      subTitleColor: subTitleColor,
      titleSize: titleSize,
      subTitleSize: subTitleSize,
      backgroundType: backgroundType,
      background: background,
      title: title,
      subTitle: subTitle,
      componentType: componentType,
    );
  }
}
