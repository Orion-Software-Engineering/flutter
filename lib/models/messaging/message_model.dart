class Message {
  String? messageId;
  String? userId;
  String? text;
  String? createdAt;
  bool? messageIsFromMe;
  Message({this.messageId, this.userId, this.text, this.createdAt});
}

class MessageToBeSent {
  String messageText = '';
  String userId = '';
  String conversationId = '';

  Map<String, String> toJson() {
    Map<String, String> map = {
      "userId": userId,
      'messageText': messageText,
      'conversationId': conversationId
    };
    return map;
  }
}

class MessageToBeDeleted {
  String messageId = '';

  Map<String, String> toJson() {
    Map<String, String> map = {"messageId": messageId};
    return map;
  }
}
