class MatchModel {
  String? userId;
  String? userName;
  String? bio;
  int? proximity;
  List? commonInterests;

  MatchModel(
      {this.userId,
      this.userName,
      this.bio,
      this.proximity,
      this.commonInterests});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "userId": userId,
      'username': userName,
      'bio': bio,
      "proximity": proximity,
      "commonInterests": commonInterests
    };
    return map;
  }
}
