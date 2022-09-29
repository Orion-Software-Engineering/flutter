import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  int messagesJustSent = 0;

  @override
  void initState() {
    super.initState();
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

    String? receiverName = widget.conversationInfo.receiverUsername;
    if (widget.conversationInfo.conversationId != '') {
      return Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              leading: CustomBackButton(
                  backColor:
                      Theme.of(context).primaryTextTheme.bodyText1?.color),
              elevation: 0.5,
              foregroundColor:
                  Theme.of(context).primaryTextTheme.bodyText1?.color,
              shadowColor: Theme.of(context).primaryTextTheme.bodyText2?.color,
              backgroundColor: Theme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () => Navigator.of(context)
                    .goToProfile(widget.conversationInfo.receiverUserId),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryTextTheme.bodyText1?.color,
                      child: Text(
                        receiverName![0],
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receiverName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Nunito",
                            fontSize: 24,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                ?.color,
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
                        createNewConversation: false,
                        addToPending: (String text) {
                          setState(() {
                            print(
                                "object\nobject\nobject\nobject\nobject\nobject\nobject\nobject\n");
                            print("before bebree nu $messagesList");
                            messagesList.add(Message(text: text));
                            messagesJustSent++;
                            print("after bebree nu $messagesList");
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              leading: CustomBackButton(
                  backColor:
                      Theme.of(context).primaryTextTheme.bodyText1?.color),
              elevation: 0.5,
              foregroundColor:
                  Theme.of(context).primaryTextTheme.bodyText1?.color,
              shadowColor: Theme.of(context).primaryTextTheme.bodyText2?.color,
              backgroundColor: Theme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () => Navigator.of(context)
                    .goToProfile(widget.conversationInfo.receiverUserId),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryTextTheme.bodyText1?.color,
                      child: Text(
                        receiverName![0],
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receiverName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Nunito",
                            fontSize: 24,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                ?.color,
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
                      child: Text(
                        "Send a message to match",
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText2
                                ?.color),
                      ),
                    ),
                    InputField(
                      conversationInfo: widget.conversationInfo,
                      apiServiceMessage: apiServiceMessage,
                      createNewConversation: true,
                      addToPending: (String text) {
                        setState(() {
                          print(
                              "object\nobject\nobject\nobject\nobject\nobject\nobject\nobject\n");
                          print("before bebree nu $messagesList");

                          messagesList.add(Message(text: text));
                          print("after bebree nu $messagesList");
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void updateMessageList() async {
    if (messagesJustSent > apiServiceMessage.messagesToAppend.length) {
      print("Won't update");
    } else {
      setState(() {
        messagesList.removeWhere((message) => message.messageId == null);
        messagesList = apiServiceMessage.listOfMessages;
        messagesJustSent = 0;
      });
    }

    print("here $messagesList");
  }
}
