import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/models/signup_model.dart';
import 'dart:convert';

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
        return SignupResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to load data ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
