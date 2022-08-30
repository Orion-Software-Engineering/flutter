import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/messaging/conversation_model.dart';
import '../utils/api_call_paths.dart';

class APIServiceConversation {
  String? userId;
  String? myUsername;
  List<String> listOfConversationIds = [];
  Map<String, List<Map<String, String>>> conversationIdsAndTheirUsers = {};
  List<ConversationInfo> listOfConversationInfo = [];

  Future getConversationsOfUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("userId");
    myUsername = sharedPreferences.getString("username");

    Uri url =
        Uri(scheme: scheme, host: host, path: getConversationsPath + userId!);

    final response = await http.get(url);
    print(response.statusCode);
    print("response body = ${json.decode(response.body)}");
    print("userId = $userId");

    List conversationsList = json.decode(response.body);
    print(conversationsList);
    for (var i in conversationsList) {
      listOfConversationIds.add(i["id"]);
    }
  }

  Future getUsersOfAllConversations() async {
    print("list of conversation users = $listOfConversationIds");
    // print(" in getUsersOfAllConversations");
    if (listOfConversationIds.isNotEmpty) {
      // print('convoList not empty');
      for (String convoId in listOfConversationIds) {
        ConversationInfo conversationInfo =
            ConversationInfo(conversationId: convoId);
        Uri url = Uri(
            scheme: scheme,
            host: host,
            path: getUsersOfAllConversationsPath + convoId);

        final response = await http.get(url);
        // print("\n\n\nprint response.body =${json.decode(response.body)}");

        List listOfUsers = json.decode(response.body);

        for (Map i in listOfUsers) {
          Map<String, String> userIdAndUsername = {
            "userId": i["id"],
            "username": i["username"]
          };
          if (userIdAndUsername["username"] != myUsername) {
            conversationInfo.receiverUsername = userIdAndUsername["username"]!;
            conversationInfo.receiverUserId = userIdAndUsername["userId"]!;
          }
          conversationInfo.conversationUsers.add(userIdAndUsername);
        }
        listOfConversationInfo.add(conversationInfo);
      }
      // print("print conversationIdsAndTheirUsers = $listOfConversationInfo");
    } else {
      // print("There are no conversation ids to work with");
    }
  }
}
