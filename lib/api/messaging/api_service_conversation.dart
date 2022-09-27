import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/messaging/conversation_model.dart';
import '../../utils/api_call_paths.dart';

class APIServiceConversation {
  String? userId;
  String? myUsername;
  List<ConversationInfo> listOfConversationInfo = [];
  String? newlyCreatedConversationId;

  Future getConversationsOfUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("userId");
    myUsername = sharedPreferences.getString("username");

    print("userid: $userId");

    Uri url =
        Uri(scheme: scheme, host: host, path: getConversationsPath + userId!);

    final response = await http.get(url);
    print("get conversations of user");
    print(response.statusCode);
    print("response body = ${json.decode(response.body)}");
    print("userId = $userId");

    List conversationsList = json.decode(response.body);
    print(conversationsList);
    for (Map i in conversationsList) {
      ConversationInfo conversationInfo =
          ConversationInfo(conversationId: i["id"]);
      conversationInfo.lastMessage = i["lastMessage"]["text"];
      conversationInfo.lastMessageIsMine =
          (i["lastMessage"]["sender"] == myUsername);
      List users = i["users"];

      for (Map user in users) {
        if (user["id"] == userId) {
          conversationInfo.senderUserId = user["id"];
          conversationInfo.senderUsername = user["username"];
        } else {
          conversationInfo.receiverUserId = user["id"];
          conversationInfo.receiverUsername = user["username"];
        }
      }
      listOfConversationInfo.add(conversationInfo);
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

    print("create conversation response");
    print(createConversationResponse.statusCode);
    print(createConversationResponse.body);

    Map<String, dynamic> createConversationResponseDecoded =
        json.decode(createConversationResponse.body);

    String? conversationId = createConversationResponseDecoded["id"];
    print("conversationId = $conversationId");
    newlyCreatedConversationId = conversationId;

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

    print("add user to conversation response");
    print(addUserToConversationResponse.statusCode);
    print(addUserToConversationResponse.body);
  }
}
