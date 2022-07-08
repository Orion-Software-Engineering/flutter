import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/constants.dart';
import 'package:matchmaking_demo/requests/login_model.dart';
import 'dart:convert';


class APIService{
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {

    final response = await http.post(logInUrl as Uri, body: requestModel.toJson());
    if (response.statusCode==200 || response.statusCode==404){
      return LoginResponseModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load data');
    }
  }
}