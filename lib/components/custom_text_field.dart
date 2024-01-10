
import 'package:firebase_training/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({
    super.key,
    required this.mycontroller,
    required this.labelText,
  });
  final String labelText;
  final TextEditingController mycontroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
      },
      controller: mycontroller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        filled: true,
        fillColor: kTextFieldFillColor,
      ),
    );
  }
}
