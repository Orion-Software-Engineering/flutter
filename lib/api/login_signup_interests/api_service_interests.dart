import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/api/login_signup_interests/api_service_signup.dart';
import 'dart:convert';
import 'package:matchmaking_demo/utils/api_call_paths.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/login_signup_interests/interest_model.dart';

class InterestAPIService {
  Future<InterestResponseModel> interest(
      InterestRequestModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: interestPath + userID,
    );

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'x-access-token': accessToken
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
