import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_message.dart';
import 'package:matchmaking_demo/models/messaging/message_model.dart';

class InputField extends StatefulWidget {
  final String conversationId;
  final APIServiceMessage apiServiceMessage;
  const InputField(
      {required this.apiServiceMessage, required this.conversationId});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  MessageToBeSent messageToBeSent = MessageToBeSent();
  TextEditingController _textToBeSent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      height: 70,
      child: Row(
        children: [
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
            ),
          ),
          IconButton(
            onPressed: () {
              if (_textToBeSent.text.trim().isNotEmpty) {
                messageToBeSent.conversationId = widget.conversationId;
                messageToBeSent.messageText = _textToBeSent.text;
                _textToBeSent.clear();
                widget.apiServiceMessage.sendMessage(messageToBeSent);
              }
            },
            icon: Icon(Icons.send_rounded),
            iconSize: 25,
          )
        ],
      ),
    );
  }
}
