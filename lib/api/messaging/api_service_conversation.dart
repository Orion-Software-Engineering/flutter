import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/messaging/conversation_model.dart';
import '../../utils/api_call_paths.dart';

class APIServiceConversation {
  String? userId;
  String? myUsername;
  List<String> listOfConversationIds = [];
  Map<String, List<Map<String, String>>> conversationIdsAndTheirUsers = {};
  List<ConversationInfo> listOfConversationInfo = [];
  late ConversationInfo conversationInfoFromMatchScreen;

  Future getConversationsOfUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("userId");
    myUsername = sharedPreferences.getString("username");

    print("userid: $userId");

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

  Future getConversationInfo() async {
    print("list of conversation users = $listOfConversationIds");
    print(" in getUsersOfAllConversations");
    if (listOfConversationIds.isNotEmpty) {
      // print('convoList not empty');
      for (String convoId in listOfConversationIds) {
        ConversationInfo conversationInfo =
            ConversationInfo(conversationId: convoId);
        Uri getUsersUrl = Uri(
            scheme: scheme,
            host: host,
            path: getUsersOfAllConversationsPath + convoId);

        Uri getLastMessageUrl =
            Uri(scheme: scheme, host: host, path: getLastMessagePath + convoId);

        final getUsersResponse = await http.get(getUsersUrl);

        List listOfUsers = json.decode(getUsersResponse.body);

        for (Map i in listOfUsers) {
          Map<String, String> userIdAndUsername = {
            "userId": i["id"],
            "username": i["username"]
          };
          if (userIdAndUsername["username"] != myUsername) {
            conversationInfo.receiverUsername = userIdAndUsername["username"]!;
            print("username ${conversationInfo.receiverUsername}");
            conversationInfo.receiverUserId = userIdAndUsername["userId"]!;
            print("id ${conversationInfo.receiverUserId}");
          }
          conversationInfo.conversationUsers.add(userIdAndUsername);

          final lastMessageResponse =
              await http.get(getLastMessageUrl, headers: headers);
          print("last message body = ${lastMessageResponse.body}");
          if (lastMessageResponse.body != "No message found") {
            var lastMessageResponseDecoded =
                json.decode(lastMessageResponse.body);

            conversationInfo.lastMessage =
                lastMessageResponseDecoded["text"] ?? "";
            if (lastMessageResponseDecoded["userId"] == userId) {
              conversationInfo.lastMessageIsMine = true;
            } else {
              conversationInfo.lastMessageIsMine = false;
            }
          } else {
            conversationInfo.lastMessage = '';
          }
        }
        listOfConversationInfo.add(conversationInfo);
      }
    }
  }

  Future<void> createConversation(
      String userIdOfMatch, String usernameOfMatch) async {
    if (userId == null) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      userId = sharedPreferences.getString("userId");
    }

    Uri url = Uri(scheme: scheme, host: host, path: createConversationPath);

    final createConversationResponse = await http.put(url,
        headers: headers,
        body: jsonEncode(CreateConversationInfo(userId: userId)));

    print(createConversationResponse.statusCode);
    print(createConversationResponse.body);

    Map<String, dynamic> createConversationResponseDecoded =
        json.decode(createConversationResponse.body);

    String? conversationId = createConversationResponseDecoded["id"];
    print("conversationId = $conversationId");

    conversationInfoFromMatchScreen =
        ConversationInfo(conversationId: conversationId);
    // conversationInfoFromMatchScreen.receiverUserId = userIdOfMatch;
    conversationInfoFromMatchScreen.receiverUsername = usernameOfMatch;

    addUserToConversation(userIdOfMatch, conversationId!);
  }

  Future<void> addUserToConversation(
      String userId, String conversationId) async {
    Uri urlAddUser =
        Uri(scheme: scheme, host: host, path: addUserToConversationPath);

    final addUserToConversationResponse = await http.put(urlAddUser,
        headers: headers,
        body: jsonEncode(AddUserToConversationRequest(
            conversationId: conversationId, recipientUserId: userId)));

    print(addUserToConversationResponse.statusCode);
    print(addUserToConversationResponse.body);
  }
}
