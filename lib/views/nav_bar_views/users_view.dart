import 'package:flutter/material.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text(
        'Users',
        style: TextStyle(fontSize: 32),
      ),
    ));
  }
}
