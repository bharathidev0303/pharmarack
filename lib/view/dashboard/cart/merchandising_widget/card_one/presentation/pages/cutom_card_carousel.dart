import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/presentation/pages/custom_card.dart';
import '../../data/model/special_offer_entity.dart';

class CustomCardCarousel extends StatefulWidget {
  const CustomCardCarousel(
      {super.key,
      required this.json,
      required this.height,
      required this.isRoundCorner});

  final String json;
  final double height;
  final bool isRoundCorner;

  @override
  State<CustomCardCarousel> createState() => _CustomCardCarouselState();
}

class _CustomCardCarouselState extends State<CustomCardCarousel> {
  List<SpecialOffers> _availableProducts = [];
  @override
  void initState() {
    super.initState();
    loadSpecialOffersItem();
  }

  void loadSpecialOffersItem() async {
    final res = await rootBundle.loadString(widget.json);
    final productData =
        SpecialOfferEntity.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      _availableProducts = productData.specialOffers!;
    });
  }

  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return _availableProducts.isEmpty
        ? const Center(
            child: SpinKitFadingCircle(
              color: AppColors.blueButtonColor,
              size: 50.0,
            ),
          )
        : Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  disableCenter: false,
                  height: kIsWeb ? 250 : widget.height,
                  viewportFraction: kIsWeb ? 0.20 : 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                itemCount: MediaQuery.sizeOf(context).width >= 480
                    ? _availableProducts.length
                    : (_availableProducts.length / 2).round(),
                itemBuilder: (context, index, realIndex) {
                  final first = index * 2;
                  int? second = 0;
                  _availableProducts.length.isOdd
                      ? second =
                          index < ((_availableProducts.length / 2).round() - 1)
                              ? first + 1
                              : 0
                      : second =
                          index < ((_availableProducts.length / 2).round() - 0)
                              ? first + 1
                              : null;
                  return MediaQuery.sizeOf(context).width >= 480
                      ? Expanded(
                          child: CustomCard(
                            imageUrl: _availableProducts[index].imageUrl,
                            isRoundCorner: widget.isRoundCorner,
                            title: _availableProducts[index].medicineName,
                            subTitle1Name: context.localizedString.ptr,
                            subTitle1Value: _availableProducts[index].ptr,
                            subTitle2Name: context.localizedString.mrp,
                            subTitle2Value: _availableProducts[index].mrp,
                          ),
                        )
                      : Row(
                          children: [first, second].map((e) {
                            return (e != null)
                                ? Expanded(
                                    child: CustomCard(
                                      imageUrl: _availableProducts[e].imageUrl,
                                      isRoundCorner: widget.isRoundCorner,
                                      title: _availableProducts[e].medicineName,
                                      subTitle1Name:
                                          context.localizedString.ptr,
                                      subTitle1Value: _availableProducts[e].ptr,
                                      subTitle2Name:
                                          context.localizedString.mrp,
                                      subTitle2Value: _availableProducts[e].mrp,
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
                children: (_availableProducts).asMap().entries.map((entry) {
                  return MediaQuery.sizeOf(context).width >= 480
                      ? _buildDotIndicator(entry, context)
                      : entry.key >= (_availableProducts.length / 2).round()
                          ? Container()
                          : _buildDotIndicator(entry, context);
                }).toList(),
              ),
            ],
          );
  }

  GestureDetector _buildDotIndicator(
      MapEntry<int, SpecialOffers> entry, BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.animateToPage(entry.key),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _current == entry.key ? 15 : 5.0,
        height: 5.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(
            color: (Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black)
                .withOpacity(_current == entry.key ? 0.9 : 0.4),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
