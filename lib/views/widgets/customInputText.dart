
import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';


class customInputText extends StatelessWidget {
  final String hint;
  final TextEditingController control;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final IconData userIcon;
  final double top = 10;

  const customInputText({
    super.key, 
    required this.control, 
    this.validator, 
    this.onSaved, 
    required this.userIcon, 
    required this.hint,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, top, 20, 0),
      child: TextFormField(
        obscureText: false,
        controller: control,
        validator: validator,
        cursorColor: primary,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(8),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
          filled: false,
          focusColor: primary,
          fillColor: white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: grey),
            borderRadius: BorderRadius.circular(20.0)

          ),
          prefixIcon: Icon(
            userIcon,
            color: primary,
          ),
        ),
      ),
    );
  }
}