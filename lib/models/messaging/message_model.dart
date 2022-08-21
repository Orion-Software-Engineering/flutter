import 'dart:convert';
import 'package:matchmaking_demo/models/messaging/dummy_messages_short.dart';

class Message {
  String? id;
  String? userId;
  String? text;
  String? conversationId;
  String? createdAt;
  Message(
      {this.id, this.userId, this.text, this.conversationId, this.createdAt});
}

class ConversationUser {
  String? conversationId;
  String? userId;
  ConversationUser({this.conversationId, this.userId});
}

//TODO all the things down here no need
//But let's not delete just yet
List<Message> messageData = [
  Message(
      id: "c1c0f212-be05-3de3-ad39-60af12f07389",
      userId: "quasi",
      text: "Eum perspiciatis rerum ut sint.",
      conversationId: "723a5eaa-1151-3a32-afad-b8bc4ab58061",
      createdAt: "1997-09-07 13:56:47"),
  Message(
      id: "0adfcdb7-593e-31c4-a0bb-0cad59fa9859",
      userId: "ratione",
      text: "Qui nobis qui rerum sed repellat.",
      conversationId: "0c319d3b-789f-3f7e-9a50-653b2230cb1e",
      createdAt: "1977-05-19 17:04:18"),
  Message(
      id: "5d6fb4b2-85d3-334d-9d5e-b13702cc62bf",
      userId: "me",
      text: "Molestiae ducimus non quia quas excepturi enim.",
      conversationId: "723a5eaa-1151-3a32-afad-b8bc4ab58061",
      createdAt: "2017-04-20 08:22:19"),
  Message(
      id: "a151eb01-7bff-3db6-bd81-2076b505b9fd",
      userId: "sint",
      text: "Dignissimos ut aut consequuntur consectetur veritatis aut.",
      conversationId: "a7ac50c7-3635-3b91-9c51-ebde8dcda628",
      createdAt: "2022-03-27 09:47:04")
];

List<String> conversationIdList = [
  "723a5eaa-1151-3a32-afad-b8bc4ab58061",
  "0c319d3b-789f-3f7e-9a50-653b2230cb1e",
  "a7ac50c7-3635-3b91-9c51-ebde8dcda628"
];

List<ConversationUser> conversationUsersList = [
  ConversationUser(
      conversationId: "723a5eaa-1151-3a32-afad-b8bc4ab58061", userId: "quasi"),
  ConversationUser(
      conversationId: "0c319d3b-789f-3f7e-9a50-653b2230cb1e",
      userId: "ratione"),
  ConversationUser(
      conversationId: "a7ac50c7-3635-3b91-9c51-ebde8dcda628", userId: "sint"),
  ConversationUser(
      conversationId: "723a5eaa-1151-3a32-afad-b8bc4ab58061", userId: "me"),
  ConversationUser(
      conversationId: "0c319d3b-789f-3f7e-9a50-653b2230cb1e", userId: "me"),
  ConversationUser(
      conversationId: "a7ac50c7-3635-3b91-9c51-ebde8dcda628", userId: "me")
];

String? getChatTitle(String conversationId) {
  for (ConversationUser i in conversationUsersList) {
    if (i.conversationId == conversationId && i.userId != 'me') {
      return i.userId;
    }
  }
  return "Not Available";
}

List<Message> getMessagesOfConversation(String conversationId) {
  List<Message> conversationMessages = [];
  for (Message i in messageData) {
    if (i.conversationId == conversationId) {
      conversationMessages.add(i);
    }
  }
  return conversationMessages;
}

Message getLastMessage(String conversationId) {
  List<Message> messages = getMessagesOfConversation(conversationId);
  Message? mostRecentMessage;
  DateTime mostRecentTime = DateTime.parse('0000-00-00 00:00:00');
  for (Message i in messages) {
    DateTime dateTime = DateTime.parse(i.createdAt.toString());
    if (dateTime.isAfter(mostRecentTime)) {
      mostRecentTime = dateTime;
      mostRecentMessage = i;
    }
  }
  return mostRecentMessage!;
}

List<String> getConversations() {
  return conversationIdList;
}

Map<String, List<Message>> getConversationMessages(
    List<String> conversationIds) {
  Map<String, List<Message>> conversationMessages = {};
  for (String i in conversationIds) {
    conversationMessages[i] = getMessagesOfConversation(i);
  }
  return conversationMessages;
}
