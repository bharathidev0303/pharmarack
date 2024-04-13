class NotificationWidgetModel {
  final String message;
  final String messageAlignment;
  final String messageColor;
  final String messageSize;
  final String backgroundType;
  final String background;
  final String title;
  final String subTitle;
  final String componentType;

  NotificationWidgetModel({
    required this.message,
    required this.messageAlignment,
    required this.messageColor,
    required this.messageSize,
    required this.backgroundType,
    required this.background,
    required this.title,
    required this.subTitle,
    required this.componentType,
  });

  factory NotificationWidgetModel.fromJson(Map<String, dynamic> json) {
    final String message = json['message'] ?? "";
    final String messageAlignment = json['message_alignment'] ?? "";
    final String messageColor = json['message_color'] ?? "";
    final String messageSize = json['message_size'] ?? "";
    final String backgroundType = json['background_type'] ?? "";
    final String background = json['background'] ?? "";
    final String title = json['title'] ?? "";
    final String subTitle = json['sub_title'] ?? "";
    final String componentType = json['component_type'] ?? "";

    return NotificationWidgetModel(
      message: message,
      messageAlignment: messageAlignment,
      messageColor: messageColor,
      messageSize: messageSize,
      backgroundType: backgroundType,
      background: background,
      title: title,
      subTitle: subTitle,
      componentType: componentType,
    );
  }
}
