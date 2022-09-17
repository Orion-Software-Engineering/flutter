/*
* The Messaging page that shows a list of contacts you've been texting
* */

import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/messaging/api_service_conversation.dart';
import 'package:matchmaking_demo/api/messaging/api_service_message.dart';
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
  List<ConversationInfo> listOfConversations = [];

  @override
  void initState() {
    super.initState();
    APIServiceConversation apiServiceConversation = APIServiceConversation();
    apiServiceConversation
        .getConversationsOfUser()
        .then((value) => apiServiceConversation.getConversationInfo())
        .then(
          (value) => setState(() {
            listOfConversations = apiServiceConversation.listOfConversationInfo;
            print("inside setState chatList = $listOfConversations");
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: ListView.builder(
          itemCount: listOfConversations.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.2),
              child: GestureDetector(
                onTap: () {
                  MessageAPIService apiServiceMessage = MessageAPIService();
                  apiServiceMessage
                      .getMessagesOfConversation(
                          listOfConversations[index].conversationId!)
                      .then((value) => Navigator.of(context)
                          .goToChatPage(listOfConversations[index]));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: messageTileColor),
                  child: ListTile(
                    //TOdo uncomment after max clears the conversations
                    // leading: AvatarPlaceholder(
                    //     firstCharacter: chatList[index].receiverUsername[0]
                    // ),
                    title: Text(listOfConversations[index].receiverUsername),
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
            // else {
            //   return Shimmer.fromColors(
            //       baseColor: Colors.teal,
            //       highlightColor: Colors.white,
            //       child: Padding(
            //           padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            //           child: ListView.builder(
            //               itemCount: 10,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return ListTile(
            //                   leading: Container(
            //                     height: 55,
            //                     width: 55,
            //                     decoration: BoxDecoration(
            //                       color: Colors.teal,
            //                       borderRadius: BorderRadius.circular(30),
            //                     ),
            //                   ),
            //                   title: SizedBox(
            //                     child: Container(
            //                       color: Colors.green,
            //                     ),
            //                     height: 20,
            //                   ),
            //                 );
            //               })));
            // }
          },
        ));
  }
}
