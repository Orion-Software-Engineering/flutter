import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/constants.dart';
import 'package:matchmaking_demo/requests/login_model.dart';
import 'dart:convert';


class APIService{
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {

    var url=Uri(
      scheme: 'https',
      host: 'orion-meet.herokuapp.com',
      path: '/api/auth/signin',
        );
    try{
      final response = await http.post(url, body: requestModel.toJson());
      if (response.statusCode==200 || response.statusCode==400){
        return LoginResponseModel.fromJson(json.decode(response.body));
      }
      else{
        throw Exception('Failed to load data ${response.statusCode}');
      }
    }
    catch(e){
      throw Exception(e);
    }

  }
}