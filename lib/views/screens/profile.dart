import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/widgets/customText.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customText(text: 'Profile page',
        textWeight: FontWeight.w500,
        textColor: primary,
        textSize: 20,),
        Container(
          decoration: BoxDecoration(
            color: secondary,
          ),
        ),
      ],
    );
  }
}