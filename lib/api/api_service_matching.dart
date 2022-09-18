import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/matching/match_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_call_paths.dart';

class MatchingApiService {
  List<MatchModel> matches = [];
  Future<void> getMatches() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url = Uri(scheme: scheme, host: host, path: getMatchesPath + userId!);

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    List responseMatches = json.decode(response.body);
    for (var m in responseMatches) {
      MatchModel match = MatchModel(
          userId: m["userId"],
          userName: m["username"],
          commonInterests: m["commonInterests"]);
      matches.add(match);
    }
  }
}
