import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/feedback/feedback_entity.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/repository/widget_builder_repository.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/FeedbackWidgetModel.dart';

Future<FeedbackWidgetModel> _loadFeedbackWidgetData(jsonData) async {
  try {
    return FeedbackWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildFeedbackWidget(children) {
  return FutureBuilder(
    future: _loadFeedbackWidgetData(children),
    builder: (context, AsyncSnapshot<FeedbackWidgetModel> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        FeedbackWidgetModel feedbackWidgetModel = snapshot.requireData;
        return FeedbackWidget(
          feedbackInfo: feedbackWidgetModel,
        );
      } else {
        return Container();
      }
    },
  );
}

class FeedbackWidget extends StatefulWidget {
  final FeedbackWidgetModel feedbackInfo;

  const FeedbackWidget({
    super.key,
    required this.feedbackInfo,
  });

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIt<WidgetBuilderRepository>()
            .fetchFeedbackList(page: 1, limit: 2),
        builder: (context, AsyncSnapshot<FeedbackEntity> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            FeedbackEntity feedbackWidgetModel = snapshot.requireData;
            return feedbackWidgetModel.feedback!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: getAlignmentPosition(
                              widget.feedbackInfo.titleAlignment),
                          child: widget.feedbackInfo.title != ""
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, bottom: 3.0),
                                  child: Text(
                                    widget.feedbackInfo.title,
                                    style: TextStyle(
                                        color: widget.feedbackInfo.titleColor !=
                                                ""
                                            ? Color(hexStringToHexInt(
                                                widget.feedbackInfo.titleColor))
                                            : AppColors.greyText,
                                        fontSize: widget
                                                    .feedbackInfo.titleSize !=
                                                ""
                                            ? double.parse(
                                                widget.feedbackInfo.titleSize)
                                            : 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : Container(),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            feedbackWidgetModel.feedback!.isNotEmpty
                                ? Wrap(
                                    children: feedbackWidgetModel.feedback!
                                        .map(
                                          (item) => IntrinsicWidth(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                item.title != "" ||
                                                        item.title != null
                                                    ? SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.44,
                                                        child: Card(
                                                          color: Color(
                                                              hexStringToHexInt(widget
                                                                      .feedbackInfo
                                                                      .cellBackground ??
                                                                  "#FFFFFF")),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            side:
                                                                const BorderSide(
                                                              color: Color(
                                                                  0XFFE2E4E9),
                                                              width: 0.5,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  AspectRatio(
                                                                    aspectRatio:
                                                                        16.0 /
                                                                            4.5,
                                                                    child: Wrap(
                                                                        children: [
                                                                          Text(
                                                                            item.title ??
                                                                                "",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            maxLines:
                                                                                2,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: double.parse(widget.feedbackInfo.cellTextSize ?? "16.0"),
                                                                              color: Color(
                                                                                hexStringToHexInt(widget.feedbackInfo.cellTextColor ?? "#000000"),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ]),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  SizedBox(
                                                                    child:
                                                                        RatingBar(
                                                                      ignoreGestures:
                                                                          true,
                                                                      minRating:
                                                                          0.5,
                                                                      itemCount:
                                                                          5,
                                                                      itemSize:
                                                                          18.0,
                                                                      itemPadding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              5.0),
                                                                      initialRating:
                                                                          double.parse(item.rating ??
                                                                              "0.0"),
                                                                      allowHalfRating:
                                                                          true,
                                                                      glow:
                                                                          false,
                                                                      unratedColor:
                                                                          AppColors
                                                                              .ratingStarUnSelectedColor,
                                                                      ratingWidget:
                                                                          RatingWidget(
                                                                        half: AppAssets
                                                                            .svg
                                                                            .feedbackStarHalf
                                                                            .svg(),
                                                                        full: AppAssets
                                                                            .svg
                                                                            .feedbackStarFull
                                                                            .svg(),
                                                                        empty: AppAssets
                                                                            .svg
                                                                            .feedbackStar
                                                                            .svg(),
                                                                      ),
                                                                      onRatingUpdate:
                                                                          (rating) {},
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
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
                  )
                : Container();
          } else {
            return Container();
          }
        });
  }
}
