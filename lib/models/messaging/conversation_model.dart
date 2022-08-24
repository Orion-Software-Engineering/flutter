class ConversationInfo {
  final String? conversationId;
  String receiverUsername = '';
  String receiverUserId = '';
  final List<Map<String, String>> conversationUsers = [];

  ConversationInfo({this.conversationId});
}
