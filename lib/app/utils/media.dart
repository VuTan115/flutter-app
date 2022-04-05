import 'package:flutter/material.dart';

class Media {
  late MediaQueryData _mediaQueryData;
  late double width;
  late double height;
  late bool isHorizontal;
  late bool isVertical;
  late double ratio;

  Media(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    isVertical = _mediaQueryData.orientation == Orientation.portrait;
    isHorizontal = _mediaQueryData.orientation == Orientation.landscape;
    ratio = (isVertical ? height : width) * 0.0012;
  }
}
