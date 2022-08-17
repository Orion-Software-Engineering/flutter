// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatItem extends StatefulWidget {
  final index;
  const ChatItem({Key? key, required this.index}) : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.index % 2 == 0) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        BubbleSpecialThree(
          text: "This is a chat bubble with a message from a sender",
          color: Color(0xFFE53935),
          tail: false,
          seen: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ]);
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        BubbleSpecialThree(
          text: "This is a chat bubble with a message from the user",
          color: Colors.grey,
          tail: false,
          seen: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ]);
    }
  }
}
