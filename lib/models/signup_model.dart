// ignore_for_file: prefer_if_null_operators

class SignupResponseModel {
  String? token;
  String? error;

  SignupResponseModel({this.token, this.error});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class SignupRequestModel {
  String username = '';
  String email = '';
  String password = '';
  String dob = '';

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'email': email.trim(),
      'password': password.trim(),
      'dob': dob.trim(),
    };

    return map;
  }
}
