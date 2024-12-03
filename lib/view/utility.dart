import 'package:flutter/material.dart';

MediaQueryData? screenData;

void initializeScreenData(BuildContext context) {
  screenData = MediaQuery.of(context);
}

double scaledHeight(double height) {
  if (screenData != null) {
    return ((screenData!.size.height - screenData!.padding.top) / 844) * height;
  }
  throw Exception("Screen data must be initialized");
}

double scaledWidth(double width) {
  if (screenData != null) {
    return (screenData!.size.width / 390) * width;
  }
  throw Exception("Screen data must be initialized");
}
