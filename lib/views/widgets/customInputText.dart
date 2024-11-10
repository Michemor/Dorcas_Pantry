
import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';

customInputText({
  required TextEditingController control,
  String hint = '',
  IconData userIcon = Icons.person,
  double top = 10,
  bool showPass = false,
  IconData suffix = Icons.visibility
}){
  return Container(
    margin: EdgeInsets.fromLTRB(20, top, 20, 0),
    child: TextField(
      obscureText: showPass,
      controller: control,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(8),
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),
        filled: false,
        fillColor: white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: grey),
          borderRadius: BorderRadius.circular(20.0)
        ),
        
        prefixIcon: Icon(
          userIcon,
          color: primary,
        ),
        suffixIcon: showPass ? Icon(suffix) : null,
      ),
    ),
  );
}