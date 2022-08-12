// ignore_for_file: prefer_if_null_operators

class ForgotPasswordResponseModel {
  String? token;
  String? error;

  ForgotPasswordResponseModel({this.token, this.error});

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class ForgotPasswordRequestModel {
  String email = '';

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
    };

    return map;
  }
}
