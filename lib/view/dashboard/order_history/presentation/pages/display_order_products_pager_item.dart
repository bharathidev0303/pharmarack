import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/dot_indicator_widget.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

class ProductListWidget extends StatefulWidget {
  final Map<int, List<String>> products;

  const ProductListWidget(this.products, {super.key});

  @override
  State<StatefulWidget> createState() => _ProductListView();
}

class _ProductListView extends State<ProductListWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              enableInfiniteScroll: false,
              height: 50.0,
              viewportFraction: 1,
              aspectRatio: 1.3,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index + 1;
                });
              }),
          carouselController: _controller,
          items: widget.products.entries.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Row(
                  children: [
                    _productItemBox(item.value.isNotEmpty ? item.value[0] : ""),
                    _productItemBox(
                        item.value.length >= 2 ? item.value[1] : ""),
                    _productItemBox(
                        item.value.length >= 3 ? item.value[2] : ""),
                  ],
                );
              },
            );
          }).toList(),
        ),
        widget.products.length >= 2
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DotIndicatorWidget(
                  currentIndex: _current,
                  entries: widget.products,
                  controller: _controller,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  _productItemBox(String productName) {
    return Expanded(
      child: productName.isNotEmpty
          ? Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(width: 1, color: AppColors.borderColor),
                  color: AppColors.white),
              child: Text(
                productName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyles.listItemSecondaryTextStyleInter10W600,
              ))
          : const SizedBox(width: double.infinity),
    );
  }
}
