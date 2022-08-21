// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/signup_model.dart';
import 'dart:convert';
import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

String userID = "";
String message = "";
int statusCode = 0;

class APIService {
  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: signUpPath,
    );

    try {
      final response = await http.post(url, body: requestModel.toJson());
      print(userID);
      if (response.statusCode == 201) {
        userID = json.decode(response.body)["userId"];
      } else if (response.statusCode == 400) {
        message = json.decode(response.body)["message"];
        switch (message) {
          case "Duplicated email":
            message = "Email already in use";
            break;
          case "Duplicated username":
            message = "Username already in use";
            break;
        }
      }
      statusCode = response.statusCode;
      return SignupResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
