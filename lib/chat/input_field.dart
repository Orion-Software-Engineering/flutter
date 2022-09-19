// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/api/messaging/api_service_message.dart';
import 'package:matchmaking_demo/models/messaging/conversation_model.dart';
import 'package:matchmaking_demo/models/messaging/message_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';

import '../api/messaging/api_service_conversation.dart';

class InputField extends StatefulWidget {
  final ConversationInfo conversationInfo;
  final MessageAPIService apiServiceMessage;
  bool createNewConversation = false;

  InputField(
      {super.key,
      required this.apiServiceMessage,
      required this.conversationInfo,
      required this.createNewConversation});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  MessageToBeSent messageToBeSent = MessageToBeSent();
  TextEditingController _textToBeSent = TextEditingController();
  bool emojiSelected = false;
  @override
  Widget build(BuildContext context) {
    if (widget.createNewConversation) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 5,
                  blurRadius: 10,
                )
              ],
            ),
            height: 66,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        emojiSelected = !emojiSelected;
                        FocusManager.instance.primaryFocus?.unfocus();
                        print("emoji$emojiSelected");
                      });
                    },
                    icon: Icon(
                      Icons.emoji_emotions,
                    ),
                    iconSize: 25,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _textToBeSent,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    onTap: () {
                      setState(() {
                        if (emojiSelected) {
                          emojiSelected = false;
                        }
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_textToBeSent.text.trim().isNotEmpty) {
                      String text = _textToBeSent.text.trim();
                      _textToBeSent.clear();
                      APIServiceConversation apiServiceConversation =
                          APIServiceConversation();
                      apiServiceConversation
                          .createConversation(
                              widget.conversationInfo.receiverUserId!,
                              widget.conversationInfo.receiverUsername!)
                          .then((value) {
                        widget.conversationInfo.conversationId =
                            apiServiceConversation.newlyCreatedConversationId;
                        sendMessageButtonFunction(text);
                      }).then((value) {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .goToChatPage(widget.conversationInfo);
                      });
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.arrowCircleUp),
                  iconSize: 25,
                ),
              ],
            ),
          ),
          Offstage(
            offstage: !emojiSelected,
            child: SizedBox(
              height: 250,
              child: EmojiPicker(
                textEditingController: _textToBeSent,
                config: Config(
                  backspaceColor: Colors.redAccent,
                  replaceEmojiOnLimitExceed: true,
                  noRecents: const Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 5,
                  blurRadius: 10,
                )
              ],
            ),
            height: 66,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        emojiSelected = !emojiSelected;
                        FocusManager.instance.primaryFocus?.unfocus();
                        print("emoji$emojiSelected");
                      });
                    },
                    icon: Icon(
                      Icons.emoji_emotions,
                    ),
                    iconSize: 25,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _textToBeSent,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    onTap: () {
                      setState(() {
                        if (emojiSelected) {
                          emojiSelected = false;
                        }
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_textToBeSent.text.trim().isNotEmpty) {
                      String text = _textToBeSent.text.trim();
                      _textToBeSent.clear();
                      sendMessageButtonFunction(text);
                      print("send");
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.arrowCircleUp),
                  iconSize: 25,
                ),

              ],
            ),
          ),
          Offstage(
            offstage: !emojiSelected,
            child: SizedBox(
              height: 250,
              child: EmojiPicker(
                textEditingController: _textToBeSent,
                config: Config(
                  backspaceColor: Colors.redAccent,
                  replaceEmojiOnLimitExceed: true,
                  noRecents: const Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  void sendMessageButtonFunction(String text) {
    messageToBeSent.conversationId = widget.conversationInfo.conversationId;
    messageToBeSent.messageText = text;
    _textToBeSent.clear();
    print("message to be sent = ${messageToBeSent.messageText}");
    print("message to be convoId = ${messageToBeSent.conversationId}");
    widget.apiServiceMessage
        .sendMessage(messageToBeSent, widget.conversationInfo.senderUserId!);
    print("send");
  }
}
// Offstage(
// offstage: emojiSelected,
// child: SizedBox(
// height: 250,
// ),
// ),
