class LoginResponseModel {
  String? token;
  String? error;
  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
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
