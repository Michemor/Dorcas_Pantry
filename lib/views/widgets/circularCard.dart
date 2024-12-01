
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';

class Circularcard extends StatelessWidget {
  final String message;

  const Circularcard({
    super.key, 
    required this.message
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        height: 200,
        width: 200,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: primary,

            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
              color: primary,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
    
    }
}