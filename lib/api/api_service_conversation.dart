import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/messaging/conversation_model.dart';
import '../utils/api_call_paths.dart';
import '../utils/constants.dart';

class APIServiceConversation {
  String? userId;
  String? myUsername;
  List<String> listOfConversationIds = [];
  Map<String, List<Map<String, String>>> conversationIdsAndTheirUsers = {};
  List<ConversationInfo> listOfConversationInfos = [];

  Future getConversationsOfUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("userId");
    myUsername = sharedPreferences.getString("username");

    Uri url =
        Uri(scheme: scheme, host: host, path: getConversationsPath + userId!);

    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    List conversationsList = json.decode(response.body);
    print(conversationsList);
    for (var i in conversationsList) {
      listOfConversationIds.add(i["id"]);
    }
    print("list of conversations of a user = $listOfConversationIds");
  }

  Future getUsersOfAllConversations() async {
    print("list of conversation users = $listOfConversationIds");
    print(" in getUsersOfAllConversations");
    if (listOfConversationIds.isNotEmpty) {
      print('convoList not empty');
      for (String convoId in listOfConversationIds) {
        ConversationInfo conversationInfo =
            ConversationInfo(conversationId: convoId);
        Uri url = Uri(
            scheme: scheme,
            host: host,
            path: getUsersOfAllConversationsPath + convoId);

        final response = await http.get(url);
        print("\n\n\nprint response.body =${json.decode(response.body)}");

        List listOfUsers = json.decode(response.body);

        for (Map i in listOfUsers) {
          Map<String, String> userIdAndUsername = {
            "userId": i["id"],
            "username": i["username"]
          };
          if (userIdAndUsername["username"] != myUsername) {
            conversationInfo.conversationName = userIdAndUsername["username"]!;
          }
          conversationInfo.conversationUsers.add(userIdAndUsername);
        }
        listOfConversationInfos.add(conversationInfo);
      }
      print("print conversationIdsAndTheirUsers = $listOfConversationInfos");
    } else {
      print("There are no conversation ids to work with");
    }
  }
}
