import 'package:flutter/material.dart';

gradient({
  required context,
  required Widget childWid,
}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color> [
              Color.fromARGB(255, 253, 127, 215),
              Color.fromARGB(255, 252, 181, 229),
              Color(0xFFffb0cf),
              Color(0xFFffbbbb),
              Color(0xFFffc9ad),
              Color(0xFFffd9a5),
              Color(0xFFffe8a5),
              Color(0xFFfff7ad),
              
            ],
            tileMode: TileMode.mirror
          )
        ),
        child: childWid,
      );
    }