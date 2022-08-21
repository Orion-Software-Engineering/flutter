import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
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
      print(response.statusCode);
      if (response.statusCode == 200) {
        String userId = json.decode(response.body)["id"];
        saveUserIdAfterLogin(userId);
      } else if (response.statusCode == 403) {
        message = "Your account is not verified. Please check your mail";
      } else if (response.statusCode == 404) {
        message = "Incorrect username or password";
      }
      statusCode = response.statusCode;
      return LoginResponseModel.fromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }

  void saveUserIdAfterLogin(String userId) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("userId", userId);
  }
}
