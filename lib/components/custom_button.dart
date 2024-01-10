
import 'package:firebase_training/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return      Container(
                  width: double
                      .infinity, // Set the button width to match the parent
                  child: ElevatedButton(
                    onPressed:ontap,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(this.text),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          kElementsColor, // Set the button's background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                )
         ;
  }
}
