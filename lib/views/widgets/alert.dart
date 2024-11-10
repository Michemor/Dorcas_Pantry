import 'package:flutter/material.dart';

Widget alert ({text}) {
  return AlertDialog(
    content: Text(text),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
  );
}