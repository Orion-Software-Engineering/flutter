import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/forgot_password_model.dart';
import 'dart:convert';
import '../utils/api_call_paths.dart';

int statusCode = 0;

class ForgotPasswordAPIService {
  Future<ForgotPasswordResponseModel> password(
      ForgotPasswordRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: forgotPasswordPath,
    );
    try {
      final response = await http.post(url, body: requestModel.toJson());
      print(response.body);
      print(response.statusCode);
      statusCode = response.statusCode;
      return ForgotPasswordResponseModel.fromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
