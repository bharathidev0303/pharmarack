import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/NotificationWidgetModel.dart';

Future<NotificationWidgetModel> _loadNotificationData(jsonData) async {
  try {
    return NotificationWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildNotificationWidget(dynamic children) {
  return FutureBuilder(
      future: _loadNotificationData(children),
      builder: (context, AsyncSnapshot<NotificationWidgetModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          NotificationWidgetModel notificationModel = snapshot.requireData;
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: notificationModel.background != "transparent"
                        ? Color(
                            hexStringToHexInt(
                                notificationModel.background ?? "#FEE6D0"),
                          )
                        : Colors.transparent),
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppAssets.svg.notificationActive.svg(
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Expanded(
                        flex: 9,
                        child: MarqueeWidget(
                          notificationModel: notificationModel,
                        ))
                  ],
                )),
          );
        } else {
          return Container();
        }
      });
}

class MarqueeWidget extends StatefulWidget {
  final NotificationWidgetModel notificationModel;
  const MarqueeWidget({super.key, required this.notificationModel});

  @override
  State<MarqueeWidget> createState() => MarqueeWidgetState();
}

class MarqueeWidgetState extends State<MarqueeWidget> {
  late ScrollController scrollController;
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 50.0);
    WidgetsBinding.instance.addPostFrameCallback(scroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: widget.notificationModel.message != "" ||
              widget.notificationModel.message != null
          ? Text(
              widget.notificationModel.message,
              style: TextStyle(
                color: Color(
                  hexStringToHexInt(
                      widget.notificationModel.messageColor ?? "#FEE6D0"),
                ),
                fontSize: double.parse(
                    widget.notificationModel.messageSize ?? "14.0"),
              ),
            )
          : Container(),
      scrollDirection: Axis.horizontal,
      controller: scrollController,
    );
  }

  void scroll(_) async {
    while (scrollController.hasClients) {
      await Future.delayed(const Duration(milliseconds: 800));
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 6000),
          curve: Curves.ease,
        );
      }
      await Future.delayed(const Duration(milliseconds: 800));
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
        );
      }
    }
  }
}
