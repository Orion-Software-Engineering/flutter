import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/matching/match_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_call_paths.dart';

class MatchingApiService {
  List<MatchModel> matchList = [];
  Future<void> getInterestBasedMatches() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url = Uri(
        scheme: scheme,
        host: host,
        path: getInterestBasedMatchesPath + userId!);

    try {
      final response = await http.get(url, headers: headers);

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List responseMatches = json.decode(response.body);
        for (var m in responseMatches) {
          MatchModel match = MatchModel(
            userId: m["userId"], userName: m["username"], proximity: 10,
            // bio: m["bio"]
          );
          matchList.add(match);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getLocationBasedMatches() async {
    print("in loc based matching");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url = Uri(
        scheme: scheme,
        host: host,
        path: getLocationBasedMatchesPath + userId!);

    try {
      final response = await http.get(url, headers: headers);

      List responseMatches = json.decode(response.body);
      print(responseMatches);
      for (List m in responseMatches) {
        MatchModel match = MatchModel(
            userId: m[0], userName: m[1], bio: m[2], proximity: m[3]);
        matchList.add(match);
      }
    } catch (e) {
      rethrow;
    }
  }
}
