import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

mainLogo({
  required String assetName,
  double imageWidth = 50,
  double imageHeight = 50,
  }) {
  return Container(
    width: imageWidth,
    height: imageHeight,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(assetName),
        fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle
    ),
  );
}

