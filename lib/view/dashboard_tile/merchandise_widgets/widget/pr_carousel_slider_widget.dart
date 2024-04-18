import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dimensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/widget/pr_positioned_button.dart';

class PRCarouselSlider extends StatefulWidget {
  final List<String> images;
  final Function onItemTap;
  final CarouselController? carouselController;
  final List<String>? buttonText;
  final Function? buttonPressed;

  const PRCarouselSlider({
    super.key,
    required this.images,
    required this.onItemTap,
    required this.buttonText,
    required this.buttonPressed,
    this.carouselController,
  });

  @override
  State<PRCarouselSlider> createState() => _PRCarouselSliderState();
}

class _PRCarouselSliderState extends State<PRCarouselSlider> {
  late CarouselController carouselController;
  int current = 0;

  @override
  void initState() {
    super.initState();
    carouselController = widget.carouselController ?? CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            height: Dimensions.carouselHeight,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: kIsWeb ? 0.3 : 1.0,
            onPageChanged: (index, _) {
              setState(() {
                current = index;
              });
            },
          ),
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return kIsWeb
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.carouselHorizontalPadding),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.circularRadius10),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () => widget.onItemTap.call(current),
                              child: CachedNetworkImage(
                                imageUrl: widget.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.carouselHorizontalPadding),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.circularRadius10),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () => widget.onItemTap.call(current),
                              child: CachedNetworkImage(
                                imageUrl: widget.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            PRPositionedButton(
                              onPressed: () =>
                                  widget.buttonPressed!.call(current),
                              text: widget.buttonText![index],
                              rightPosition: 20.0,
                              bottomPosition: 30.0,
                              minWidth: 90.0,
                              height: 25.0,
                              textColor: context.colors.textPrimary!,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
        _buildIndicatorRow(),
      ],
    );
  }

  Widget _buildIndicatorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.images.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => carouselController.animateToPage(entry.key),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: current == entry.key ? 15.0 : 5.0,
            height: Dimensions.height5,
            margin: const EdgeInsets.only(
                top: Dimensions.margin10, left: Dimensions.margin5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.circularRadius10),
              color: AppColors.pagerIndicatorColor
                  .withOpacity(current == entry.key ? 1 : 0.26),
            ),
          ),
        );
      }).toList(),
    );
  }
}
