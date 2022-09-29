import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/location_model.dart';
import 'package:matchmaking_demo/utils/like_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_call_paths.dart';

class LocationAPIService {
  Future<LocationResponseModel> location(LocationPostModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: locationPath,
    );

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': accessToken
    };

    try {
      final response = await http.post(url,
          body: jsonEncode(requestModel), headers: headers);
      print(requestModel.toJson());
      print("Location response:${response.statusCode}");
      if (response.statusCode == 200) {
        return LocationResponseModel.fromJson(response.body);
      } else {
        throw Exception("Failed to load data ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
