import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/forgot_password_model.dart';
import 'dart:convert';
import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

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

      if (response.statusCode == 200) {
        return ForgotPasswordResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
