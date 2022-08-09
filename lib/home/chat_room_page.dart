/*
* The Messaging page that shows a list of contacts you've been texting
* */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/utils/variables.dart';

import '../components/home/avatar_placeholder.dart';

class ChatRoom extends StatelessWidget {
  // const ChatRoom({Key? key}) : super(key: key);

  //TODO conversations that jave just 2 members are chats.
  //TODO val is to hold the Zodiac sign on the other member and based on that an avatar is selected. this cna be implemented after the backend is done
  String val = "Leo";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.2),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: messageTileColor),
                child: ListTile(
                  leading: AvatarPlaceholder(
                    avatar:
                        Image.asset('assets/images/messaging/Avatars/$val.png'),
                  ),
                  title: Text(chatList[index].name),
                  subtitle: Row(
                    children: [
                      FaIcon(
                        (chatList[index].sent)
                            ? FontAwesomeIcons.anglesUp
                            : FontAwesomeIcons.anglesDown,
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      Text(
                          (chatList[index].lastMessageType == MessageType.image)
                              ? "Image received"
                              : chatList[index].lastMessage),
                    ],
                  ),
                  trailing: Text((chatList[index].numberOfUnreads == 0)
                      ? ""
                      : chatList[index].numberOfUnreads.toString()),
                ),
              ),
            );
          }),
    );
  }
}
