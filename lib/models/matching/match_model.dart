class MatchModel {
  String? userId;
  String? userName;
  List<dynamic>? commonInterests;

  MatchModel({this.userId, this.userName, this.commonInterests});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "userId": userId,
      'username': userName,
      'commonInterests': commonInterests
    };
    return map;
  }
}
