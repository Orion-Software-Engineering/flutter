import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/matching/match_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_call_paths.dart';

class MatchingApiService {
  bool isLoading = true;
  List<MatchModel> matchList = [];
  Future<void> getInterestBasedMatches() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url = Uri(
        scheme: scheme,
        host: host,
        path: getInterestBasedMatchesPath + userId!);

    String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': accessToken
    };
    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        isLoading = false;
        List responseMatches = json.decode(response.body);
        for (var m in responseMatches) {
          MatchModel match = MatchModel(
              userId: m["userId"],
              userName: m["username"],
              proximity: 10,
              bio: m["bio"]);
          matchList.add(match);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getLocationBasedMatches() async {
    print("in loc based");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url = Uri(
        scheme: scheme,
        host: host,
        path: getLocationBasedMatchesPath + userId!);

    String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': accessToken
    };

    try {
      final response = await http.get(url, headers: headers);

      List responseMatches = json.decode(response.body);
      print(responseMatches);
      print(matchList.length);
      for (Map<String, dynamic> m in responseMatches) {
        MatchModel match = MatchModel(
            userId: m["userId"],
            userName: m["username"],
            bio: m["bio"],
            proximity: m["proximity"],
            commonInterests: m["commonInterests"]);
        matchList.add(match);
      }
      print(matchList.length);
    } catch (e) {
      rethrow;
    }
  }
}
