import 'package:flutter/material.dart';
import 'package:matchmaking_demo/chat/chat_list.dart';
import 'package:matchmaking_demo/chat/input_field.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String senderName = "Dillys";
  String senderStatus = "online";
  @override
  Widget build(BuildContext context) {
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
          onTap: () => Navigator.of(context).pushNamed('/home'),
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
              ChatList(),
              InputField(),
            ],
          ),
        ],
      ),
    );
  }
}
