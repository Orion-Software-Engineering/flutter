// ignore_for_file: prefer_if_null_operators

class InterestResponseModel {
  String? token;
  String? error;

  InterestResponseModel({this.token, this.error});

  factory InterestResponseModel.fromJson(List<dynamic> jsonIn) {
    Map<String, dynamic> json = jsonIn[0];
    return InterestResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class InterestRequestModel {
  List<String> interests = [];

  Map<String, List<String>> toJson() {
    Map<String, List<String>> map = {
      'interests': interests,
    };
    return map;
  }
}
