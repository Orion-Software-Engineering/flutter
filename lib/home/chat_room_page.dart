import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/utils/variables.dart';

import '../components/home/avatar_placeholder.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.2),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: messageTileColor),
          child: ListTile(
            leading: AvatarPlaceholder(),
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
                Text((chatList[index].lastMessageType == MessageType.image)
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
    });
  }
}
