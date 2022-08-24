import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_message.dart';
import 'package:matchmaking_demo/chat/chat_list.dart';
import 'package:matchmaking_demo/chat/input_field.dart';
import 'package:matchmaking_demo/models/messaging/conversation_model.dart';
import '../models/messaging/message_model.dart';

class Chat extends StatefulWidget {
  final ConversationInfo conversationInfo;
  const Chat({required this.conversationInfo});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  APIServiceMessage apiServiceMessage = APIServiceMessage();
  List<Message> messagesList = [];

  @override
  void initState() {
    super.initState();
    print("convoId from chat page ${widget.conversationInfo.conversationId}");

    apiServiceMessage
        .getMessagesOfConversation(widget.conversationInfo.conversationId!)
        .then((value) => updateMessageList());
  }

  @override
  Widget build(BuildContext context) {
    String senderName = widget.conversationInfo.receiverUsername;
    String senderStatus = "online";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: const <Color>[Color(0xFFE53935), Color(0xFF1A237E)])),
        ),
        title: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/profile'),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(senderName[0]),
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
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    senderStatus,
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ChatList(
                messagesList: messagesList,
              ),
              InputField(
                  conversationId: widget.conversationInfo.conversationId!,
                  apiServiceMessage: apiServiceMessage),
            ],
          ),
        ],
      ),
    );
  }

  void updateMessageList() async {
    setState(() {
      messagesList = apiServiceMessage.listOfMessages;
    });
    print("here $messagesList");
  }
}
