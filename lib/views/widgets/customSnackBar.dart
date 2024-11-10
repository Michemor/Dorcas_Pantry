import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/colors.dart';


customSnackBar({title, message, err_type}) {
  return Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        colorText: primary,
        backgroundColor: white,
        animationDuration: Duration(seconds: 5),
        );
    
}