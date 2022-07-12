import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/login_model.dart';
import 'dart:convert';
import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: logInPath,
    );
    try {
      final response = await http.post(url, body: requestModel.toJson());

      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
