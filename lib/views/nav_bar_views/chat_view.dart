import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text(
        'Chat',
        style: TextStyle(fontSize: 32),
      ),
    ));
  }
}
