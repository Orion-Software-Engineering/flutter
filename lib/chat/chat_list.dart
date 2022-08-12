import 'package:flutter/material.dart';
import 'package:matchmaking_demo/chat/chat_item.dart';

class ChatList extends StatefulWidget {
  ChatList({Key? key}) : super(key: key);
  final ScrollController listScrollController = new ScrollController();

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
      reverse: true,
      itemBuilder: (context, index) => ChatItem(index: index),
      controller: widget.listScrollController,
      padding: EdgeInsets.all(0),
      itemCount: 50,
    ));
  }
}
