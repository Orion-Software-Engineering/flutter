class ConversationResponseModel {
  final String? conversationId;
  // final String? conversationName;
  // final List? conversationUsers;

  ConversationResponseModel({this.conversationId});
  factory ConversationResponseModel.fromJson(Map<String, dynamic> json) {
    return ConversationResponseModel(conversationId: json["id"] ?? "");
  }
}
