// ignore_for_file: prefer_if_null_operators

class LoginResponseModel {
  String? token;
  String? error;

  LoginResponseModel({this.token, this.error});

  //TODO: Take the user's ID also
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String username = '';
  String password = '';

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
