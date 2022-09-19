class ConversationInfo {
  String? conversationId = '';
  String? receiverUsername = '';
  String? receiverUserId = '';
  String? senderUserId = '';
  String? senderUsername = '';
  String lastMessage = '';
  bool lastMessageIsMine = true;
  final List<Map<String, String>> conversationUsers = [];

  ConversationInfo({this.conversationId});
  ConversationInfo.withoutConversationId(
      this.receiverUserId, this.receiverUsername, this.senderUserId);
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
