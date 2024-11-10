
import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';

buttonIcon({
  required Text iconName,
  required String pathIcon,
  double iconHeight = 24,
}) {
  return ElevatedButton.icon(onPressed: () {

  },
  icon: Image.asset(pathIcon,
  height: iconHeight,), 
  style: ElevatedButton.styleFrom(
    backgroundColor: white,
    foregroundColor: grey,
    elevation: 2.0,
  ),
  label: iconName);
}