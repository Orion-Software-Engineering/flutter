// ignore_for_file: prefer_if_null_operators

class LoginResponseModel {
  String? token;
  String? error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(String message) {
    return LoginResponseModel(
      token: message != null ? message : "",
      error: message != null ? message : "",
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
