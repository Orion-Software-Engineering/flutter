import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/login_model.dart';
import 'dart:convert';
import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

String message = "";
int statusCode = 0;

class LoginAPIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: logInPath,
    );
    try {
      final response = await http.post(url, body: requestModel.toJson());
      print(response.body);
      print(response.body);

      if (response.statusCode == 403 &&
          response.body == "Verify your account before logging in") {
        message = "Your account is not verified. Please check your mail";
      } else if (response.statusCode == 404) {
        switch (json.decode(response.body)["message"]) {
          case "Invalid Credentials":
            message = "Incorrect password";
            break;
          case "Account not found":
            message = "Username does not exist";
            break;
        }
      }
      statusCode = response.statusCode;
      return LoginResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
