
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/screens/login.dart';

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
     centerTitle: true,
     leading: null,
  );
}