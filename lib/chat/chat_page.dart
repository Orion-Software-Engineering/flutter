import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/messaging/api_service_message.dart';
import 'package:matchmaking_demo/chat/chat_list.dart';
import 'package:matchmaking_demo/chat/input_field.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/models/messaging/conversation_model.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import '../api/messaging/api_service_conversation.dart';
import '../models/matching/match_model.dart';
import '../models/messaging/message_model.dart';

class Chat extends StatefulWidget {
  final ConversationInfo conversationInfo;
  const Chat({super.key, required this.conversationInfo});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  MessageAPIService apiServiceMessage = MessageAPIService();
  List<Message> messagesList = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    if (widget.conversationInfo.conversationId != '') {
      pollForMessages();
    }
  }

  void pollForMessages() {
    if (widget.conversationInfo.conversationId != '') {
      timer = Timer.periodic(Duration(seconds: 5), (timer) {
        apiServiceMessage
            .getMessagesOfConversation(widget.conversationInfo.conversationId!)
            .then((value) => updateMessageList());
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {

    print("senderuserid = ${widget.conversationInfo.senderUserId}");
    print("rUsername = ${widget.conversationInfo.receiverUsername}");
    print("rUserId = ${widget.conversationInfo.receiverUserId}");

    String? senderName = widget.conversationInfo.receiverUsername;
    if (widget.conversationInfo.conversationId != '') {
      return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: CustomBackButton(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: const <Color>[
              Color(0xFFE53935),
              Color(0xFF1A237E)
            ])),
          ),
          title: GestureDetector(
            onTap: () => Navigator.of(context)
                .goToProfile(widget.conversationInfo.receiverUserId),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(senderName![0]),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      senderName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Nunito",
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                ChatList(
                  apiServiceMessage: apiServiceMessage,
                  messagesList: messagesList,
                ),
                InputField(
                    conversationInfo: widget.conversationInfo,
                    apiServiceMessage: apiServiceMessage,
                    createNewConversation: false),
              ],
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: const <Color>[
              Color(0xFFE53935),
              Color(0xFF1A237E)
            ])),
          ),
          title: GestureDetector(
            onTap: () => Navigator.of(context)
                .goToProfile(widget.conversationInfo.receiverUserId),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(senderName![0]),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      senderName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Nunito",
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Center(
                  child: Text("Send a message to match"),
                ),
                InputField(
                  conversationInfo: widget.conversationInfo,
                  apiServiceMessage: apiServiceMessage,
                  createNewConversation: true,
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  void updateMessageList() async {
    setState(() {
      messagesList = apiServiceMessage.listOfMessages;
    });
    print("here $messagesList");
  }
}
