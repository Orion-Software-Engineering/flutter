import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/messaging/message_model.dart';
import '../../utils/api_call_paths.dart';

class MessageAPIService {
  List<Message> listOfMessages = [];
  late String? myUserId;

  void getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    myUserId = sharedPreferences.getString("userId")!;
  }

  Future getMessagesOfConversation(String conversationId) async {
    getUserId();

    Uri url = Uri(
        scheme: scheme,
        host: host,
        path: getMessagesOfConversationPath + conversationId);

    final response = await http.get(url);
    print("get messages of conversation response");
    print(response.statusCode);
    // print(response.body);

    List messagesResponse = json.decode(response.body);

    for (Map<String, dynamic> i in messagesResponse) {
      Message message = Message(
          messageId: i["id"],
          userId: i["userId"],
          text: i["text"],
          createdAt: i["createdAt"]);
      if (message.userId == myUserId) {
        message.messageIsFromMe = true;
      } else {
        message.messageIsFromMe = false;
      }
      listOfMessages.add(message);
    }
  }

  Future sendMessage(MessageToBeSent messageToBeSent, String userId) async {
    Uri url = Uri(scheme: scheme, host: host, path: sendMessagePath);

    messageToBeSent.userId = userId;

    print("json endcode requestmodel ${jsonEncode(messageToBeSent)}");
    final response = await http.put(url,
        headers: headers, body: jsonEncode(messageToBeSent));

    print("Send message code: ${response.statusCode}");
    print("Send message body: ${response.body}");
  }

  Future deleteMessage(MessageToBeDeleted messageToBeDeleted) async {
    Uri url = Uri(scheme: scheme, host: host, path: deleteMessagePath);

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.delete(url,
        headers: headers, body: jsonEncode(messageToBeDeleted));
    if (response.statusCode == 200) {
      print("Deleted");
    }
  }
}
