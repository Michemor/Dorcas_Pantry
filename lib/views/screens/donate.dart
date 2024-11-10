import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          
          decoration: BoxDecoration(
            color: secondary,
          ),
        ),
        Text('Donate'),
      ],
    );
  }
}