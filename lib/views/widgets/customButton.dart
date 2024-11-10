
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/register_controller.dart';
import 'package:pantry/views/widgets/customText.dart';





class Custombutton extends StatelessWidget {
  final String buttonName;
  final Widget nextPage;
  final buttonColor;
  final double width;
 
 

  const Custombutton({
    super.key,
    required this.nextPage, 
    required this.buttonName, 
    this.buttonColor = white, 
    this.width = 2.0,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Get.to(nextPage);
    }, 
    style: ElevatedButton.styleFrom(
      backgroundColor: primary, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      )
    ),
    
    child: customText(text: buttonName,
    textColor: white,
    textWeight: FontWeight.w300,
    textSize: 14));
  }
}