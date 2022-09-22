// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/login_signup_interests/signup_model.dart';
import 'dart:convert';
import '../../utils/api_call_paths.dart';

String userID = "";
String message = "";
int statusCode = 0;

class SignUpAPIService {
  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: signUpPath,
    );

    try {
      final response = await http.post(url, body: requestModel.toJson());
      if (response.statusCode == 201 || response.statusCode == 400) {
        if (response.statusCode == 201) {
          userID = json.decode(response.body)["userId"];
        } else if (response.statusCode == 400) {
          message = "The username or email is already in use";
        }
        statusCode = response.statusCode;
        return SignupResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
