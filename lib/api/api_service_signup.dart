// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/signup_model.dart';
import 'dart:convert';
import '../utils/api_call_paths.dart';
import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

String userID = "";
String message = "";

class APIService {
  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: signUpPath,
    );

    try {
      final response = await http.post(url, body: requestModel.toJson());
      if (response.statusCode == 201) {
        userID = json.decode(response.body)["userId"];
        return SignupResponseModel.fromJson(json.decode(response.body));
      } else {
        print(response.body);
        throw Exception("Failed to load data ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
