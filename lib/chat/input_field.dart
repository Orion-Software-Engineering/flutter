// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/api/api_service_message.dart';
import 'package:matchmaking_demo/models/messaging/message_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class InputField extends StatefulWidget {
  final String conversationId;
  final MessageAPIService apiServiceMessage;
  const InputField(
      {Key? key,
      required this.apiServiceMessage,
      required this.conversationId});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  MessageToBeSent messageToBeSent = MessageToBeSent();
  TextEditingController _textToBeSent = TextEditingController();
  bool emojiSelected = false;
  @override
  Widget build(BuildContext context) {
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
                      print("emoji${emojiSelected}");
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
                    messageToBeSent.conversationId = widget.conversationId;
                    messageToBeSent.messageText = _textToBeSent.text.trim();
                    _textToBeSent.clear();
                    widget.apiServiceMessage.sendMessage(messageToBeSent);
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

// Offstage(
// offstage: emojiSelected,
// child: SizedBox(
// height: 250,
// ),
// ),
