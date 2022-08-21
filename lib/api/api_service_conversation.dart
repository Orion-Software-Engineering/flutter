import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class APIServiceConversation {
  String? userId;
  List<String> listOfConversationIds = [];
  Map<String, List<Map<String, String>>> conversationIdsAndTheirUsers = {};

  Future getConversationsOfUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("userId");

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
    print(
        "CCCCCCCCCCCC\nCCCCCCCCCCCC\nCCCCCCCCCCCC\nCCCCCCCCCCCC\nCCCCCCCCCCCC\nCCCCCCCCCCCC\nCCCCCCCCCCCC\nCCCCCCCCCCCC\nCCCCCCCCCCCC\nCCCCCCCCCCCC\n");
    print("list of conversations of a user = ${listOfConversationIds}");
  }

  Future getUsersOfAllConversations() async {
    print("list of conversation users = ${listOfConversationIds}");
    print(" in getUsersOfAllConversations");
    if (listOfConversationIds.isNotEmpty) {
      print('convoList not empty');
      for (String convoId in listOfConversationIds) {
        Uri url = Uri(
            scheme: scheme,
            host: host,
            path: getUsersOfAllConversationsPath + convoId);

        final response = await http.get(url);
        print("\n\n\nprint response.body =${json.decode(response.body)}");

        List listOfUsers = json.decode(response.body);
        conversationIdsAndTheirUsers[convoId] = [];

        for (Map i in listOfUsers) {
          Map<String, String> userIdAndUsername = {
            "userId": i["id"],
            "username": i["username"]
          };
          conversationIdsAndTheirUsers[convoId]!.add(userIdAndUsername);
        }
      }
      print(
          "print conversationIdsAndTheirUsers = $conversationIdsAndTheirUsers");
    } else {
      print("There are no conversation ids to work with");
    }
  }
}
