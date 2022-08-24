// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatItem extends StatelessWidget {
  final bool messageIsFromMe;
  final String text;
  // ignore: use_key_in_widget_constructors
  const ChatItem({required this.messageIsFromMe, required this.text});

  @override
  Widget build(BuildContext context) {
    if (!messageIsFromMe) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        BubbleSpecialThree(
          text: text,
          color: Color(0xFFE53935),
          tail: false,
          seen: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ]);
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        BubbleSpecialThree(
          text: text,
          color: Colors.grey,
          tail: false,
          seen: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ]);
    }
  }
}
