import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text(
        'Settings',
        style: TextStyle(fontSize: 32),
      ),
    ));
  }
}