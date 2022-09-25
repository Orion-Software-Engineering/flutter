/*
* The Messaging page that shows a list of contacts you've been texting
* */

import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/messaging/api_service_conversation.dart';
import 'package:matchmaking_demo/api/messaging/api_service_message.dart';
import 'package:matchmaking_demo/models/messaging/conversation_model.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../components/home/avatar_placeholder.dart';

// ignore: must_be_immutable
class ChatRoom extends StatefulWidget {
  VoidCallback home;
  ChatRoom({super.key, required this.home});
  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  late SharedPreferences sharedPreferences;
  String? myUsername;
  List<ConversationInfo> listOfConversations = [];
  APIServiceConversation apiServiceConversation = APIServiceConversation();
  // Timer? timer;

  @override
  void initState() {
    super.initState();
    APIServiceConversation apiServiceConversation = APIServiceConversation();
    apiServiceConversation
        .getConversationsOfUser()
        .then((value) => apiServiceConversation.getConversationInfo())
        .then(
      (value) {
        if (!mounted) {
          return;
        }
        setState(() {
          listOfConversations = apiServiceConversation.listOfConversationInfo;
          print("inside setState chatList = $listOfConversations");
        });
      },
    );
    // timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   apiServiceConversation
    //       .getConversationsOfUser()
    //       .then((value) => apiServiceConversation.getConversationInfo())
    //       .then(
    //         (value) => setState(() {
    //       listOfConversations =
    //           apiServiceConversation.listOfConversationInfo;
    //       print("inside setState chatList = $listOfConversations");
    //     }),
    //   );
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (listOfConversations.isNotEmpty) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: ListView.builder(
            itemCount: listOfConversations.length,
            itemBuilder: (BuildContext context, int index) {
              print("last message${listOfConversations[0].lastMessageIsMine}");
              String lastMessageSender;
              if (listOfConversations[index].lastMessageIsMine) {
                lastMessageSender = "me";
              } else {
                lastMessageSender =
                    listOfConversations[index].receiverUsername!;
              }
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
                    decoration: BoxDecoration(color: messageTileColor),
                    child: ListTile(
                      leading: AvatarPlaceholder(
                        firstCharacter:
                            listOfConversations[index].receiverUsername![0],
                        characterColor:
                            Theme.of(context).primaryTextTheme.bodyText1?.color,
                      ),
                      title: Text(
                        listOfConversations[index].receiverUsername!,
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                ?.color),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            " $lastMessageSender : ${listOfConversations[index].lastMessage} ",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1
                                    ?.color),
                          ),
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
    } else {
      return Container(
        child: Center(
          child: MaterialButton(
              color: Colors.orange,
              onPressed: widget.home,
              child: Text("Match to create your first conversation")),
        ),
      );
    }
  }

  void getUserDetails() async {
    sharedPreferences = await SharedPreferences.getInstance();
    myUsername = sharedPreferences.getString("username");
  }
}
