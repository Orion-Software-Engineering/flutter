import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../models/login_signup_interests/login_model.dart';
import '../../utils/api_call_paths.dart';

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
        print("login body ${response.body}");
        String userId = json.decode(response.body)["id"];
        String username = json.decode(response.body)["username"];
        String accessToken = json.decode(response.body)["accessToken"];
        saveUserDetailsAfterLogin(userId, username, accessToken);

        OneSignal.shared.setExternalUserId(userId).then((results) {
          print("one signal result${results.toString()}");
        }).catchError((error) {
          print("udgyhdb ${error.toString()}");
        });
      } else if (response.statusCode == 403) {
        message = "Your account is not verified. Please check your mail";
      } else if (response.statusCode == 404) {
        message = "Incorrect username or password";
      } else {
        throw Exception('Failed to load data ${response.statusCode}');
      }
      statusCode = response.statusCode;
      return LoginResponseModel.fromJson(response.statusCode, response.body);
    } catch (e) {
      rethrow;
    }
  }

  void saveUserDetailsAfterLogin(
      String userId, String username, String accessToken) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("userId", userId);
    sharedPreferences.setString("username", username);
    sharedPreferences.setString("accessToken", accessToken);
  }
}
