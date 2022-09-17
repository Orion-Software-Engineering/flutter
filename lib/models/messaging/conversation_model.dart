class ConversationInfo {
  final String? conversationId;
  String receiverUsername = '';
  String receiverUserId = '';
  String lastMessage = '';
  final List<Map<String, String>> conversationUsers = [];

  ConversationInfo({this.conversationId});
}

class CreateConversationInfo {
  String? userId;

  CreateConversationInfo({this.userId});

  Map<String, dynamic> toJson() {
    return {"userId": userId};
  }
}

class AddUserToConversationRequest {
  String recipientUserId;
  String conversationId;

  AddUserToConversationRequest(
      {required this.conversationId, required this.recipientUserId});

  Map<String, String> toJson() {
    return {"userId": recipientUserId, "conversationId": conversationId};
  }
}
