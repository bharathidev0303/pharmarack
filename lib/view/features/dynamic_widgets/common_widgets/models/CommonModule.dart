import 'package:flutter/material.dart';

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
