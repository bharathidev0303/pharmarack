import 'package:flutter/material.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/CardWidgets/CardWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/Carousel/CarouselWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/CrmBar/CrmBarWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/FeedBack/FeedBackWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/Image/ImageWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/RewardWidgets/RewardWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/TopWidgets/TopWidgets.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/Video/VideoWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/notification/NotificationWidget.dart';

List<Widget> buildWidgetsFromJsonData(Map<String, dynamic> jsonData) {
  List<Widget> widgets = [];
  jsonData.forEach((key, componentData) {
    String componentType = componentData['component_type'] ?? "";
    Map<String, dynamic> children = componentData ?? [];
    // Creating specific widgets based on componentType
    switch (componentType) {
      case 'crm_bar':
        widgets.add(buildCrmBarWidget(children));
      case 'carousel':
        widgets.add(buildCarouselWidget(children));
      case 'top_widget':
        widgets.add(buildTopWidget(children));
      case 'image':
        widgets.add(buildImageWidget(children));
      case 'feedback':
        widgets.add(buildFeedbackWidget(children));
      case 'reward':
        widgets.add(buildRewordsWidget(children));
      case 'card':
        widgets.add(buildCardWidget(children));
      case 'notification':
        widgets.add(buildNotificationWidget(children));
      case 'video':
        widgets.add(buildVideoWidget(children));
      // Add more cases as needed for other component types
      default:
        // Handle unknown component types or return a default widget
        widgets.add(Container());
    }
  });

  return widgets;
}
