import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/navigation/app_router.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CarouselWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/cms_page_navigator_model.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/pageConfigModel.dart';

Future<CarouselWidgetModel> _loadCarouselData(jsonData) async {
  try {
    return CarouselWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildCarouselWidget(children) {
  return FutureBuilder(
    future: _loadCarouselData(children),
    builder: (context, AsyncSnapshot<CarouselWidgetModel> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        CarouselWidgetModel carouselModel = snapshot.requireData;
        debugPrint('LENGTH: ${carouselModel.carousel.length}');
        return (CarouselWidget(
          carouselData: carouselModel,
        ));
      } else {
        return Container();
      }
    },
  );
}

class CarouselWidget extends StatefulWidget {
  final CarouselWidgetModel carouselData;

  const CarouselWidget({super.key, required this.carouselData});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int current = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
      child: Column(
        children: [
          widget.carouselData.showTitle
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.carouselData.title != ""
                        ? Expanded(
                            flex: widget.carouselData.showViewMoreBtn == false
                                ? 9
                                : 6,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 23.0, right: 23.0, bottom: 5.0),
                              child: Text(
                                widget.carouselData.title,
                                style: TextStyle(
                                  color: Color(hexStringToHexInt(
                                      widget.carouselData.titleColor ??
                                          "#000000")),
                                  fontWeight: FontWeight.w500,
                                  fontSize: double.parse(
                                      widget.carouselData.titleSize ?? "14.0"),
                                ),
                                textAlign: getTextAlignPosition(
                                    widget.carouselData.titleAlignment),
                              ),
                            ),
                          )
                        : Container(),
                    widget.carouselData.showViewMoreBtn
                        ? Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 23.0),
                              child: InkWell(
                                onTap: () => {
                                  AppRouter.cmsWidgetPageNavigator(
                                      cmsPageNavigatorModel:
                                          CmsPageNavigatorModel(
                                    context: context,
                                    title: widget.carouselData.title,
                                    linkType: widget.carouselData.linkType,
                                    linkTo: widget.carouselData.viewMoreLinkTo,
                                    linkToExtra:
                                        widget.carouselData.viewMoreLinkToExtra,
                                  )),
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.carouselData.viewMoreBtnLabel ??
                                            "",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.blueLinkTextColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Icon(
                                          Icons.arrow_forward_outlined,
                                          size: 14,
                                          color: AppColors.blueLinkTextColor,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                )
              : Container(),
          DynamicCarouselSlider(carouselData: widget.carouselData),
        ],
      ),
    );
  }
}

class DynamicCarouselSlider extends StatefulWidget {
  final CarouselWidgetModel carouselData;
  const DynamicCarouselSlider({
    super.key,
    required this.carouselData,
  });

  @override
  State<DynamicCarouselSlider> createState() => DynamicCarouselSliderState();
}

class DynamicCarouselSliderState extends State<DynamicCarouselSlider> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    int itemsVisibleMobile = int.parse(widget.carouselData.itemsVisibleMobile);
    List<Carousel> carouselItem = widget.carouselData.carousel;

    if (itemsVisibleMobile == 1) {
      return Padding(
        padding:
            EdgeInsets.only(top: widget.carouselData.title != "" ? 0.0 : 10.0),
        child: Column(
          children: [
            CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: widget.carouselData.autoStart ?? false,
                  enlargeCenterPage: false,
                  height: (widget.carouselData.carousel[0].mobileAssestDimension
                          .height) *
                      0.32,
                  autoPlayInterval: Duration(
                      milliseconds: widget.carouselData.duration != ""
                          ? int.parse(widget.carouselData.duration)
                          : 5000),
                  autoPlayAnimationDuration: const Duration(milliseconds: 10),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: kIsWeb ? 0.3 : 1.0,
                  onPageChanged: (index, _) {
                    setState(() {
                      current = index;
                    });
                  },
                ),
                itemCount: widget.carouselData.carousel.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            // borderRadius: BorderRadius.circular(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => {
                                      AppRouter.cmsWidgetPageNavigator(
                                          cmsPageNavigatorModel:
                                              CmsPageNavigatorModel(
                                        context: context,
                                        linkType: carouselItem[index].linkType,
                                        linkTo: carouselItem[index].linkTo,
                                        linkToExtra:
                                            carouselItem[index].linkToExtra,
                                      )),
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                        imageUrl: carouselItem[index]
                                                .mobileAssetUrl ??
                                            "",
                                        fit: BoxFit.fill,
                                        fadeInDuration:
                                            const Duration(microseconds: 100),
                                        fadeOutDuration:
                                            const Duration(microseconds: 100),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          color: AppColors.appBackgroundColor,
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
                        ),
                      ),
                    ],
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  widget.carouselData.carousel.asMap().entries.map((entry) {
                return GestureDetector(
                  // onTap: () => carouselController.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: current == entry.key ? 15.0 : 5.0,
                    height: 5.0,
                    margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.pagerIndicatorColor
                          .withOpacity(current == entry.key ? 1 : 0.26),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      );
    } else if (itemsVisibleMobile == 2) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: widget.carouselData.autoStart ?? false,
                enlargeCenterPage: false,
                height: kIsWeb
                    ? 250
                    : (widget.carouselData.carousel[0].mobileAssestDimension
                            .height) *
                        (widget.carouselData.carousel[0].mobileAssestDimension
                                    .width >
                                800
                            ? 0.17
                            : 0.37),
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(
                    milliseconds: widget.carouselData.duration != ""
                        ? int.parse(widget.carouselData.duration)
                        : 5000),
                autoPlayAnimationDuration: const Duration(milliseconds: 10),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: kIsWeb ? 0.3 : 1,
                onPageChanged: (index, _) {
                  setState(() {
                    current = index;
                  });
                },
              ),
              itemCount: MediaQuery.sizeOf(context).width >= 480
                  ? widget.carouselData.carousel.length
                  : (widget.carouselData.carousel.length / 2).round(),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final first = index * 2;
                int? second = 0;
                widget.carouselData.carousel.length.isOdd
                    ? second = index <
                            ((widget.carouselData.carousel.length / 2).round() -
                                1)
                        ? first + 1
                        : 0
                    : second = index <
                            ((widget.carouselData.carousel.length / 2).round() -
                                0)
                        ? first + 1
                        : null;
                return MediaQuery.sizeOf(context).width >= 480
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => {
                                    AppRouter.cmsWidgetPageNavigator(
                                        cmsPageNavigatorModel:
                                            CmsPageNavigatorModel(
                                      context: context,
                                      linkType: carouselItem[index].linkType,
                                      linkTo: carouselItem[index].linkTo,
                                      linkToExtra:
                                          carouselItem[index].linkToExtra,
                                    )),
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          carouselItem[index].mobileAssetUrl ??
                                              "",
                                      fit: BoxFit.fill,
                                      fadeInDuration:
                                          const Duration(microseconds: 100),
                                      fadeOutDuration:
                                          const Duration(microseconds: 100),
                                      width: double.infinity,
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        color: AppColors.appBackgroundColor,
                                        child: const Center(
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [first, second].map((e) {
                          return (e != null)
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: ClipRRect(
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () => {
                                              AppRouter.cmsWidgetPageNavigator(
                                                  cmsPageNavigatorModel:
                                                      CmsPageNavigatorModel(
                                                context: context,
                                                linkType:
                                                    carouselItem[e].linkType,
                                                linkTo: carouselItem[e].linkTo,
                                                linkToExtra:
                                                    carouselItem[e].linkToExtra,
                                              )),
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: CachedNetworkImage(
                                                imageUrl: carouselItem[e]
                                                        .mobileAssetUrl ??
                                                    "",
                                                fit: BoxFit.fill,
                                                fadeInDuration: const Duration(
                                                    microseconds: 100),
                                                fadeOutDuration: const Duration(
                                                    microseconds: 100),
                                                width: double.infinity,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(child: Container());
                        }).toList(),
                        // )
                      );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  widget.carouselData.carousel.asMap().entries.map((entry) {
                return MediaQuery.sizeOf(context).width >= 480
                    ? GestureDetector(
                        // onTap: () => carouselController.animateToPage(entry.key),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: current == entry.key ? 15.0 : 5.0,
                          height: 5.0,
                          margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.pagerIndicatorColor
                                .withOpacity(current == entry.key ? 1 : 0.26),
                          ),
                        ),
                      )
                    : entry.key >=
                            (widget.carouselData.carousel.length / 2).round()
                        ? Container()
                        : GestureDetector(
                            // onTap: () => carouselController.animateToPage(entry.key),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: current == entry.key ? 15.0 : 5.0,
                              height: 5.0,
                              margin:
                                  const EdgeInsets.only(top: 10.0, left: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.pagerIndicatorColor
                                    .withOpacity(
                                        current == entry.key ? 1 : 0.26),
                              ),
                            ),
                          );
              }).toList(),
            )
          ],
        ),
      );
    } else if (itemsVisibleMobile == 3) {
      return Padding(
        padding: EdgeInsets.only(
            top: widget.carouselData.title != "" ? 0.0 : 10.0,
            left: 10.0,
            right: 15.0),
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: widget.carouselData.autoStart ?? false,
                enlargeCenterPage: false,
                height: kIsWeb
                    ? 250
                    : (widget.carouselData.carousel[0].mobileAssestDimension
                            .height) *
                        (widget.carouselData.carousel[0].mobileAssestDimension
                                    .width >
                                800
                            ? 0.11
                            : 0.26),
                autoPlayInterval: Duration(
                    milliseconds: widget.carouselData.duration != ""
                        ? int.parse(widget.carouselData.duration)
                        : 5000),
                autoPlayAnimationDuration: const Duration(milliseconds: 10),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: kIsWeb ? 0.3 : 1,
                onPageChanged: (index, _) {
                  setState(() {
                    current = index;
                  });
                },
              ),
              itemCount: MediaQuery.sizeOf(context).width >= 480
                  ? widget.carouselData.carousel.length
                  : (widget.carouselData.carousel.length / 3).round(),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final first = index * 3;
                final int second = index <=
                        (widget.carouselData.carousel.length / 2).ceil() - 1
                    ? first + 1
                    : 0;
                final int third = index <=
                        (widget.carouselData.carousel.length / 3).ceil() - 1
                    ? first + 2
                    : 0;
                return MediaQuery.sizeOf(context).width >= 480
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => {
                                    AppRouter.cmsWidgetPageNavigator(
                                        cmsPageNavigatorModel:
                                            CmsPageNavigatorModel(
                                      context: context,
                                      linkType: carouselItem[index].linkType,
                                      linkTo: carouselItem[index].linkTo,
                                      linkToExtra:
                                          carouselItem[index].linkToExtra,
                                    )),
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          carouselItem[index].mobileAssetUrl ??
                                              "",
                                      fit: BoxFit.fill,
                                      fadeInDuration:
                                          const Duration(microseconds: 100),
                                      fadeOutDuration:
                                          const Duration(microseconds: 100),
                                      width: double.infinity,
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        color: AppColors.appBackgroundColor,
                                        child: const Center(
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [first, second, third].map((e) {
                          return (e != null)
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: ClipRRect(
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () => {
                                              AppRouter.cmsWidgetPageNavigator(
                                                  cmsPageNavigatorModel:
                                                      CmsPageNavigatorModel(
                                                context: context,
                                                linkType:
                                                    carouselItem[e].linkType,
                                                linkTo: carouselItem[e].linkTo,
                                                linkToExtra:
                                                    carouselItem[e].linkToExtra,
                                              )),
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: CachedNetworkImage(
                                                imageUrl: carouselItem[e]
                                                        .mobileAssetUrl ??
                                                    "",
                                                fit: BoxFit.fill,
                                                fadeInDuration: const Duration(
                                                    microseconds: 100),
                                                fadeOutDuration: const Duration(
                                                    microseconds: 100),
                                                width: double.infinity,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(child: Container());
                        }).toList(),
                        // )
                      );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  widget.carouselData.carousel.asMap().entries.map((entry) {
                return MediaQuery.sizeOf(context).width >= 480
                    ? GestureDetector(
                        // onTap: () => carouselController.animateToPage(entry.key),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: current == entry.key ? 15.0 : 5.0,
                          height: 5.0,
                          margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.pagerIndicatorColor
                                .withOpacity(current == entry.key ? 1 : 0.26),
                          ),
                        ),
                      )
                    : entry.key >=
                            (widget.carouselData.carousel.length / 3).round()
                        ? Container()
                        : GestureDetector(
                            // onTap: () => carouselController.animateToPage(entry.key),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: current == entry.key ? 15.0 : 5.0,
                              height: 5.0,
                              margin:
                                  const EdgeInsets.only(top: 10.0, left: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.pagerIndicatorColor
                                    .withOpacity(
                                        current == entry.key ? 1 : 0.26),
                              ),
                            ),
                          );
              }).toList(),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
