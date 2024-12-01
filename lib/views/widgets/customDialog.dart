

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../configs/colors.dart';

actionDialog({
  String title = 'Dialog Title',
  String message = 'Dialog message'
}){
  return  Get.dialog(
        barrierDismissible: true,
        Dialog(
          backgroundColor: white,
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 150,
            width: 400,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(title,
                style: GoogleFonts.roboto(
                  color: primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),),
                Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                Text(message,
                style: GoogleFonts.roboto(
                  color: primary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text('OK',
                  style: GoogleFonts.roboto(
                    color: primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),),
                )
              ],
            ),
          ),
        )
      );
    
}