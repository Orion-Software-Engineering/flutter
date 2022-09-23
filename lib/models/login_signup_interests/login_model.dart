// ignore_for_file: prefer_if_null_operators

class LoginResponseModel {
  String? token;
  String? error;
  int? statusCode;
  LoginResponseModel({this.token, this.error, this.statusCode});

  factory LoginResponseModel.fromJson(int statusCode, String message) {
    return LoginResponseModel(
        token: message != null ? message : "",
        error: message != null ? message : "",
        statusCode: statusCode);
  }
}

class LoginRequestModel {
  String username = '';
  String password = '';
  String player_id = '';

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
