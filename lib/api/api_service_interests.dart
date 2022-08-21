import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/interest_model.dart';
import 'package:matchmaking_demo/api/api_service_signup.dart';
import 'dart:convert';
import '../utils/api_call_paths.dart';
import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class InterestAPIService {
  Future<InterestResponseModel> interest(
      InterestRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: interestPath + userID,
    );

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      print(jsonEncode(requestModel));
      final response = await http.post(url,
          body: jsonEncode(requestModel), headers: headers);

      print(response.body);
      if (response.statusCode == 200) {
        return InterestResponseModel.fromJson(json.decode(response.body));
      } else {
        // print(response.body);
        throw Exception("Failed to load data ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
