import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CardWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/CardWidgets/CardImageWidget.dart';

Future<CardWidgetModel> _loadCardWidgetData(jsonData) async {
  try {
    return CardWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildCardWidget(children) {
  return FutureBuilder(
      future: _loadCardWidgetData(children),
      builder: (context, AsyncSnapshot<CardWidgetModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          CardWidgetModel cardWidgetModel = snapshot.requireData;
          return CardImageWidget(cardWidgetModel: cardWidgetModel);
          // switch (cardWidgetModel.type) {
          //   case 'image':
          //     return CardImageWidget(cardWidgetModel: cardWidgetModel);
          //   case 'products':
          //   case 'percent':
          //   default:
          //     return Container();
          // }
        } else {
          return Container();
        }
      });
}

Widget cardTitleWidget(CardWidgetModel cardWidgetData, context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cardWidgetData.title ?? "",
          style: TextStyle(
              color: Color(
                hexStringToHexInt(cardWidgetData.titleColor ?? "#000000"),
              ),
              fontSize: double.parse(cardWidgetData.titleSize ?? "16.0"),
              fontWeight: FontWeight.w500),
        ),
        cardWidgetData.showViewMoreBtn
            ? InkWell(
                onTap: () => {
                  widgetPageNavigator(
                      context,
                      cardWidgetData.title!,
                      cardWidgetData.linkType!,
                      cardWidgetData.viewMoreLinkTo!,
                      cardWidgetData.viewMoreLinkToExtra!),
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        cardWidgetData.viewMoreBtnLabel ?? "",
                        style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.blueLinkTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          size: 14,
                          color: AppColors.blueLinkTextColor,
                        ),
                      ),
                    ]),
              )
            : Container(),
      ],
    ),
  );
}
