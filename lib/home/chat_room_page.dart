/*
* The Messaging page that shows a list of contacts you've been texting
* */

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_conversation.dart';
import 'package:matchmaking_demo/api/api_service_message.dart';
import 'package:matchmaking_demo/models/messaging/conversation_model.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
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
            chatList = apiServiceConversation.listOfConversationInfo;
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
            if (chatList != []) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.2),
                child: GestureDetector(
                  onTap: () {
                    MessageAPIService apiServiceMessage = MessageAPIService();
                    apiServiceMessage.getMessagesOfConversation(
                        chatList[index].conversationId!);
                    Navigator.of(context).goToChatPage(chatList[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: messageTileColor),
                    child: ListTile(
                      leading: AvatarPlaceholder(
                          firstCharacter: chatList[index].receiverUsername[0]),
                      title: Text(chatList[index].receiverUsername),
                      subtitle: Row(
                        children: [
                          Text("to be implemented"),
                          //TODO dont change to constant if prompted
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Shimmer.fromColors(
                  baseColor: Colors.teal,
                  highlightColor: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              title: SizedBox(
                                child: Container(
                                  color: Colors.green,
                                ),
                                height: 20,
                              ),
                            );
                          })));
            }
          },
        ));
  }
}
