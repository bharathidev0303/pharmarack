import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/banner_products_list_page/banner_product_list.dart';

hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}

calculateImageDimension(String img, double defaultHeight) {
  double height = defaultHeight;
  Image image = Image.network(img);
  image.image.resolve(ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        height = myImage.height.toDouble();
      },
    ),
  );
  return height;
}

widgetPageNavigator(context, String tittle, String linkType, String linkTo,
    String linkToExtra) {
  switch (linkType) {
    case 'internal':
      if (linkTo == "/searchProduct" && linkToExtra != "") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BannerProductsListPage(
              tittle: tittle,
              productIds: linkToExtra,
            ),
          ),
        );
      } else if (linkTo == "/cashbackDeals") {
        // FlyyFlutterPlugin.openFlyyOffersPage();
      } else if (linkTo == "/rewards") {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const RewardsPage()),
        // );
      } else {
        print(linkTo);
      }
    // case 'external':
    //   Navigator.pushReplacementNamed(context, externalLink);
    default:
      print(linkType);
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

TextAlign getTextAlignPosition(String align) {
  if (align == "left") {
    return TextAlign.left;
  } else if (align == "right") {
    return TextAlign.right;
  } else if (align == "center") {
    return TextAlign.center;
  } else if (align == "justify") {
    return TextAlign.justify;
  } else {
    return TextAlign.left;
  }
}

Alignment getAlignmentPosition(String align) {
  if (align == "left") {
    return Alignment.topLeft;
  } else if (align == "right") {
    return Alignment.topRight;
  } else if (align == "center") {
    return Alignment.topCenter;
  } else if (align == "justify") {
    return Alignment.topLeft;
  } else {
    return Alignment.topLeft;
  }
}
