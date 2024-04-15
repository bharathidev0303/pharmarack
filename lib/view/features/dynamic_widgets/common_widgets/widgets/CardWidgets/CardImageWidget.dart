import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/navigation/app_router.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CardWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/cms_page_navigator_model.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/pageConfigModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/CardWidgets/CardWidget.dart';

class CardImageWidget extends StatefulWidget {
  final CardWidgetModel cardWidgetModel;
  const CardImageWidget({super.key, required this.cardWidgetModel});

  @override
  State<CardImageWidget> createState() => _CardImageWidgetState();
}

class _CardImageWidgetState extends State<CardImageWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.cardWidgetModel.itemsVisibleMobile == '1') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            cardTitleWidget(widget.cardWidgetModel, context),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.cardWidgetModel.children.isNotEmpty
                    ? Wrap(
                        children: widget.cardWidgetModel.children
                            .take(4)
                            .map(
                              (item) => IntrinsicWidth(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () => {
                                        AppRouter.cmsWidgetPageNavigator(
                                            cmsPageNavigatorModel:
                                                CmsPageNavigatorModel(
                                          context: context,
                                          linkType: item.linkType,
                                          linkTo: item.linkTo,
                                          linkToExtra: item.linkToExtra,
                                        )),
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 0.0),
                                        child: item.assetUrl != ""
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: CachedNetworkImage(
                                                  imageUrl: item.assetUrl ?? "",
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.89,
                                                  fadeInDuration:
                                                      const Duration(
                                                          microseconds: 100),
                                                  fadeOutDuration:
                                                      const Duration(
                                                          microseconds: 100),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    color: AppColors
                                                        .appBackgroundColor,
                                                    child: const Center(
                                                      child: Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : Text('Empty list'),
              ],
            ),
          ],
        ),
      );
    } else if (widget.cardWidgetModel.itemsVisibleMobile == '2') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Container(
          child: Column(
            children: [
              cardTitleWidget(widget.cardWidgetModel, context),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.cardWidgetModel.children.isNotEmpty
                      ? Wrap(
                          children: widget.cardWidgetModel.children
                              .asMap()
                              .entries
                              .take(4)
                              .map(
                                (item) => IntrinsicWidth(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () => {
                                          AppRouter.cmsWidgetPageNavigator(
                                              cmsPageNavigatorModel:
                                                  CmsPageNavigatorModel(
                                            context: context,
                                            linkType: item.value.linkType,
                                            linkTo: item.value.linkTo,
                                            linkToExtra: item.value.linkToExtra,
                                          )),
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 10.0,
                                              right:
                                                  item.key.isOdd ? 0.0 : 10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  item.value.assetUrl ?? "",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.43,
                                              fadeInDuration: const Duration(
                                                  microseconds: 100),
                                              fadeOutDuration: const Duration(
                                                  microseconds: 100),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                color: AppColors
                                                    .appBackgroundColor,
                                                child: const Center(
                                                  child: Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : const Text('Empty list'),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
