import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/delete_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../utils/api_call_paths.dart';

String message = "";
int statusCode = 0;

class DeleteAccountAPIService {
  Future<DeleteAccountResponseModel> delete(
      DeleteAccountRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: deleteAccountPath,
    );

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': accessToken
    };

    try {
      final response =
          await http.post(url, body: requestModel.toJson(), headers: headers);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        message = "Account Deleted";
      } else {
        message = "Could not delete account. Try again";
      }
      statusCode = response.statusCode;
      return DeleteAccountResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
