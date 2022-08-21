class ConversationInfo {
  final String? conversationId;
  String conversationName = "incoming";
  final List<Map<String, String>> conversationUsers = [];

  ConversationInfo({this.conversationId});
}
