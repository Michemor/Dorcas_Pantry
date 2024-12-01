import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/colors.dart';


customSnackBar({title, message, errType}) {
  return Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        colorText: primary,
        backgroundColor: white,
        animationDuration: Duration(seconds: 20),
        mainButton: TextButton(onPressed: () {
          Get.close(1);
        }, child: Text('OK'))
        );
    
}