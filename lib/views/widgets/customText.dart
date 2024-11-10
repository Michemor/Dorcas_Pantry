
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';

customText({
  required String text,
  Color textColor = primary,
  double textSize = 30,
  FontWeight textWeight = FontWeight.w600,
  FontStyle styleText = FontStyle.normal,
}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: textSize,
        fontWeight: textWeight,
        color: textColor,
        fontStyle: styleText,
      )
    ),
  );

}