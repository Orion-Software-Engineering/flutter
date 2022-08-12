// ignore_for_file: prefer_if_null_operators

class InterestResponseModel {
  String? token;
  String? error;

  InterestResponseModel({this.token, this.error});

  factory InterestResponseModel.fromJson(Map<String, dynamic> json) {
    return InterestResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class InterestRequestModel {
  late dynamic interests;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'interests': interests,
    };
    return map;
  }
}
