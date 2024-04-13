class FeedbackWidgetModel {
  final String label;
  final String title;
  final String titleAlignment;
  final String subTitle;
  final String subTitleSize;
  final String subTitleColor;
  final String titleColor;
  final String titleSize;
  final String backgroundType;
  final String background;
  final String cellBackgroundType;
  final String cellBackground;
  final String cellTextAlignment;
  final String cellTextColor;
  final String cellTextSize;

  FeedbackWidgetModel({
    required this.label,
    required this.title,
    required this.subTitle,
    required this.subTitleSize,
    required this.subTitleColor,
    required this.titleAlignment,
    required this.titleColor,
    required this.titleSize,
    required this.backgroundType,
    required this.background,
    required this.cellBackgroundType,
    required this.cellBackground,
    required this.cellTextAlignment,
    required this.cellTextColor,
    required this.cellTextSize,
  });

  factory FeedbackWidgetModel.fromJson(Map<String, dynamic> json) {
    final String label = json['label'] ?? "";
    final String title = json['title'] ?? "";
    final String subTitle = json['sub_title'] ?? "";
    final String subTitleSize = json['sub_title_size'] ?? "";
    final String subTitleColor = json['sub_title_color'] ?? "";
    final String titleAlignment = json['title_alignment'] ?? "";
    final String titleColor = json['title_color'] ?? "";
    final String titleSize = json['title_size'] ?? false;
    final String backgroundType = json['background_type'] ?? "";
    final String background = json['background'] ?? "";
    final String cellBackgroundType = json['cell_background_type'] ?? "";
    final String cellBackground = json['cell_background'] ?? "";
    final String cellTextAlignment = json['cell_text_alignment'] ?? "";
    final String cellTextColor = json['cell_text_color'] ?? "";
    final String cellTextSize = json['cell_text_size'] ?? "";

    return FeedbackWidgetModel(
      label: label,
      title: title,
      subTitle: subTitle,
      subTitleSize: subTitleSize,
      subTitleColor: subTitleColor,
      titleAlignment: titleAlignment,
      titleColor: titleColor,
      titleSize: titleSize,
      backgroundType: backgroundType,
      background: background,
      cellBackgroundType: cellBackgroundType,
      cellBackground: cellBackground,
      cellTextAlignment: cellTextAlignment,
      cellTextColor: cellTextColor,
      cellTextSize: cellTextSize,
    );
  }
}
