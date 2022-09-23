import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/delete_model.dart';
import 'dart:convert';
import '../../utils/api_call_paths.dart';

String message = "";

class DeleteAccountAPIService {
  Future<DeleteAccountResponseModel> delete(
      DeleteAccountRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: deleteAccountPath,
    );
    try {
      final response = await http.post(url, body: requestModel.toJson());
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        message = "Account Deleted";
      } else {
        message = "Could not delete account. Try again";
      }
      return DeleteAccountResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
