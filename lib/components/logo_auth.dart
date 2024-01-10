
import 'package:firebase_training/constants.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: kBackgroundColor,
          width: 2.0,
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/login_image.jpg'),
        ),
      ),
    );
  }
}
