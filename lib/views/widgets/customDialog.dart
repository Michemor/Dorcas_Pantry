import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';


customDialog ({required text, required message, required action_text}) {
  return Get.defaultDialog(
    title: text,
    content: Text(message,
    style: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: primary,
      ),
    ),),
    buttonColor: primary,
    onConfirm: () {
      
    },
    onCancel: () { 
      Get.back();
      }
    // what do you need confirmed
    // use onConfirm
  );
}