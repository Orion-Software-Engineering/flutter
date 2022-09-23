class MatchModel {
  String? userId;
  String? userName;
  String? bio;
  int? proximity;

  MatchModel({this.userId, this.userName, this.bio, this.proximity});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "userId": userId,
      'username': userName,
      'bio': bio,
      "proximity": proximity
    };
    return map;
  }
}
