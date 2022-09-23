// ignore_for_file: prefer_if_null_operators

class DeleteAccountResponseModel {
  String? token;
  String? error;

  DeleteAccountResponseModel({this.token, this.error});

  factory DeleteAccountResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class DeleteAccountRequestModel {
  String userId = '';
  String username = '';
  String password = '';

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId.trim(),
      'username': username.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
