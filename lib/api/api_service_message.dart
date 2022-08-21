import 'dart:convert';

import 'package:matchmaking_demo/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../models/messaging/message_model.dart';
import '../utils/api_call_paths.dart';

class APIServiceMessage {
  List<Message> listOfMessages = [];
  Future getMessagesOfConversation(String conversationId) async {
    Uri url = Uri(
        scheme: scheme,
        host: host,
        path: getMessagesOfConversationPath + conversationId);

    final response = await http.get(url);

    print(
        "GHGHHGHGHGHGHG\nGHGHHGHGHGHGHG\nGHGHHGHGHGHGHG\nGHGHHGHGHGHGHG\nGHGHHGHGHGHGHG\nGHGHHGHGHGHGHG\nGHGHHGHGHGHGHG\nGHGHHGHGHGHGHG\n");
    print(response.statusCode);
    print(response.body);

    List listOfMessages = json.decode(response.body);

    for (Map<String, String> i in listOfMessages) {
      Message message = Message(
          messageId: i["id"],
          userId: i["userId"],
          text: i["text"],
          createdAt: i["createdAt"]);
      listOfMessages.add(message);
    }
  }
}
