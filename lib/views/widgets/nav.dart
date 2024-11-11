
import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';

navBar({
  required Text navTitle,

}) {
  return AppBar(
    backgroundColor: primary,
    toolbarHeight: 80.0,
    elevation: 2,
    iconTheme: IconThemeData(
      color: white,
      size: 20,
    ),
    title: navTitle,
    foregroundColor: white,
    actions: [
      IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.logout),
        ),
        IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.settings),
        ),
    ],
  );
}