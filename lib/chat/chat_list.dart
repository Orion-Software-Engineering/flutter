import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_message.dart';
import 'package:matchmaking_demo/chat/chat_item.dart';

import '../models/messaging/message_model.dart';

class ChatList extends StatefulWidget {
  MessageToBeDeleted messageToBeDeleted = MessageToBeDeleted();
  MessageAPIService apiServiceMessage;
  List<Message> messagesList;
  ChatList({required this.messagesList, required this.apiServiceMessage});
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
              return GestureDetector(
                onLongPress: () {
                  showOptionsWhenMessageLongPressed(index);
                },
                child: ChatItem(
                  time: widget.messagesList[index].createdAt!,
                  messageIsFromMe: widget.messagesList[index].messageIsFromMe!,
                  text: widget.messagesList[index].text!,
                ),
              );
            }
            // controller: widget.listScrollController,
            ));
  }

  showOptionsWhenMessageLongPressed(int messageIndex) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              widget.messageToBeDeleted.messageId =
                  widget.messagesList[messageIndex].messageId!;
              widget.apiServiceMessage.deleteMessage(widget.messageToBeDeleted);
              Navigator.pop(context);
            },
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 6),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(40)),
                child: Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.white,
                  size: 35,
                ),
                // child: Text(
                //   "Delete",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       fontFamily: 'Nunito'),
                // ),
              ),
            ),
          );
        });
  }
}
