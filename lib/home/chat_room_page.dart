/*
* The Messaging page that shows a list of contacts you've been texting
* */

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_conversation.dart';
import 'package:matchmaking_demo/api/api_service_message.dart';
import 'package:matchmaking_demo/models/messaging/conversation_model.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import '../components/home/avatar_placeholder.dart';

class ChatRoom extends StatefulWidget {
  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<ConversationInfo> chatList = [];

  @override
  void initState() {
    super.initState();
    APIServiceConversation apiServiceConversation = APIServiceConversation();
    apiServiceConversation
        .getConversationsOfUser()
        .then((value) => apiServiceConversation.getUsersOfAllConversations())
        .then(
          (value) => setState(() {
            chatList = apiServiceConversation.listOfConversationInfos;
            print("inside setstate chatList = $chatList");
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.2),
              child: GestureDetector(
                onTap: () {
                  APIServiceMessage apiServiceMessage = APIServiceMessage();
                  apiServiceMessage.getMessagesOfConversation(
                      chatList[index].conversationId!);
                  //TODO route to dm and put the function above in its initState instead
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: messageTileColor),
                  child: ListTile(
                    leading: AvatarPlaceholder(
                        firstCharacter: chatList[index].conversationName[0]),
                    title: Text(chatList[index].conversationName),
                    subtitle: Row(
                      children: [
                        Text("to be implemented"),
                        //TODO dont change to constant if prompted
                      ],
                    ),
                    // trailing: Text((chatList[index].numberOfUnreads == 0)
                    //     ? ""
                    // : chatList[index].numberOfUnreads.toString()),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
