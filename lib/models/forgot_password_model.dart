// ignore_for_file: prefer_if_null_operators

class ForgotPasswordResponseModel {
  String? token;
  String? error;

  ForgotPasswordResponseModel({this.token, this.error});

  factory ForgotPasswordResponseModel.fromJson(String json) {
    return ForgotPasswordResponseModel(
      token: json != null ? json : "",
      error: json != null ? json : "",
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
