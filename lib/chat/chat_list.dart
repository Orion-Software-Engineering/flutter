import 'package:flutter/material.dart';
import 'package:matchmaking_demo/chat/chat_item.dart';

import '../models/messaging/message_model.dart';

class ChatList extends StatefulWidget {
  List<Message> messagesList;
  ChatList({required this.messagesList});
  final ScrollController listScrollController = ScrollController();

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: widget.messagesList.length,
            reverse: false,
            itemBuilder: (BuildContext context, int index) {
              return ChatItem(
                messageIsFromMe: widget.messagesList[index].messageIsFromMe!,
                text: widget.messagesList[index].text!,
              );
            }
            // controller: widget.listScrollController,
            ));
  }
}
