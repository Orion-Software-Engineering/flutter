import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../utils/api_call_paths.dart';
import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class APIServiceLogin {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: logInPath,
    );
    try {
      final response = await http.post(url, body: requestModel.toJson());
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        String userId = json.decode(response.body)["id"];
        saveUserIdAfterLogin(userId);

        return LoginResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data ${response.statusCode}');
      }
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
